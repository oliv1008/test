extends Control

onready var Monster = preload("res://Scenes/Monsters/GodotMonster.tscn")
onready var MonsterTexture = preload("res://icon.png")
onready var dialogue_battle = $DialogueBattle

var buffer_action = []

var player_team = []
var monsters = []
var entities_on_screen = []
var current_player

var total_exp = 0

var monsters_button = []
onready var chara_box1 = $TeamContainer/Chara1
onready var chara_box2 = $TeamContainer/Chara2
onready var chara_box3 = $TeamContainer/Chara3
onready var chara_box4 = $TeamContainer/Chara4
onready var chara_boxes = [chara_box1, chara_box2, chara_box3, chara_box4]

enum STATE {BATTLE, VICTORY}
var state = BATTLE

func _ready():
	nc.add_observer(self, "action_button_pressed", "on_action_button_pressed")
	
	dialogue_battle.connect("input_enter", self, "_on_input_enter")
	dialogue_battle.connect("buff_end", self, "_on_buff_end")
	dialogue_battle.connect("state_change", self, "_on_state_change")
	dialogue_battle.connect("enter_break", self, "_on_enter_break")
	dialogue_battle.connect("resume_break", self, "_on_resume_break")
	dialogue_battle.connect("tag_buff", self, "_on_tag_buff")

#On initialise le côté du joueur
	print("player_team = ", player_team)
	print("chara_boxes = ", chara_boxes)
	for i in range(0, player_team.size()):
		var character = player_team[i]
		var chara_box = chara_boxes[i]
		chara_box.initialize_chara_box(character, self)
	current_player = 0
	chara_boxes[current_player].set_process_input(true)
	chara_boxes[current_player].my_grab_focus()
	
#On initialise le côté monstre
	for i in range(0, monsters.size()):
		print("nouveau monstre")
		var new_monster = monsters[i]
		var new_button = Button.new()
		total_exp += new_monster.stat["experience"]
		new_button.set_meta("number", i)
		monsters_button.append(new_button)
		new_button.icon = MonsterTexture
		$MonstersContainer/HBoxContainer.add_child(new_button)
		new_button.focus_neighbour_bottom = new_button.get_path()
		new_button.focus_neighbour_top = new_button.get_path()
		new_button.connect("pressed", self, "on_monster_selected")
	
func initialize(player_team_arg, monsters_arg):
	player_team = player_team_arg
	monsters = monsters_arg
	entities_on_screen = player_team + monsters

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func show_dialogue(dialogue_arg):
	dialogue_battle.buff_text(dialogue_arg, 0.02)
	dialogue_battle.buff_break()
	dialogue_battle.set_state(dialogue_battle.STATE_OUTPUT)

func on_monster_selected():
	var character = buffer_action[0]["character"]
	var target = get_focus_owner().get_meta("number")
	var action = buffer_action[0]["character"].stat["actions"][buffer_action[0]["action"]]
	character.call(action, monsters, target, self)
	get_focus_owner().release_focus()

func on_action_button_pressed(observer, notificationName, notificationData):
	buffer_action.append(notificationData)
	monsters_button[0].grab_focus()
	print("Le ", notificationData["character"].stat["nom"], " fait l'action ", notificationData["character"].stat["actions"][notificationData["action"]])

func refresh_battlescreen():
	#On refresh le côté joueur
	var iteration = 0
	for chara in player_team:
		chara_boxes[iteration].refresh()
		iteration += 1
	#On refresh le côté monstre
	var dead_monsters = 0
	for monster in monsters_button:
		var number = monster.get_meta("number")
		if monsters[number].stat["vie"] <= 0:
			monster.visible = false
			dead_monsters += 1
	if dead_monsters == monsters_button.size():
		state = VICTORY
		return 1
	else:
		return 0
		
		
func next_action():
#On désactive le précédant "actionnaire"
	chara_boxes[current_player].set_process_input(false)
	
#On avance jusqu'a trouvé une entité capable d'agir
	if current_player == entities_on_screen.size() - 1:
		current_player = 0
	else: 
		current_player += 1
	while entities_on_screen[current_player].stat["vie"] <= 0:
		current_player += 1
		if current_player == entities_on_screen.size():
			current_player = 0
			
#Cette entité est-elle un ennemie ?
	if current_player == player_team.size():
		chara_boxes[current_player].set_process_input(false)
		if get_focus_owner() != null:
			get_focus_owner().release_focus()
		monsters[current_player - player_team.size()].IA(monsters, player_team, self)
	elif current_player > player_team.size():
		monsters[current_player - player_team.size()].IA(monsters, player_team, self)

#Si non, c'est donc un joueur
	else:
		if get_focus_owner() != null:
			get_focus_owner().release_focus()
		chara_boxes[current_player].set_process_input(true)
		chara_boxes[current_player].my_grab_focus()
		
func victory_dialogue():
	dialogue_battle.buff_text(str("Felicitation, vous remportez ", total_exp, " points d'experience !"), 0.02)
	dialogue_battle.buff_break()
	dialogue_battle.set_state(dialogue_battle.STATE_OUTPUT)
	
func _on_input_enter(s):
	print("Input Enter ",s)

func _on_buff_end():
	print("Buff End")

func _on_state_change(i):
	print("New state: ", i)

func _on_enter_break():
	print("Enter Break")

func _on_resume_break():
	print("Resume Break")
	if state == BATTLE:
		dialogue_battle.clear_text()
		if refresh_battlescreen() == 0:
			next_action()
		else:
			victory_dialogue()
	elif state == VICTORY:
		global.close_battlescreen()

func _on_tag_buff(s):
	print("Tag Buff ",s)