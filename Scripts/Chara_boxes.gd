extends VBoxContainer

onready var NewTheme = preload("res://BS_Chara_Boxes.tres")
var button_stack = [[]]
var current_actions = []
var battlescreen
var character

func _ready():
	theme = NewTheme
	set_process_input(false)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		print("get_focus_owner().get_meta(\"action\") = ", get_focus_owner().get_meta("action"))
		nc.post_notification("action_button_pressed", {"character": character, "action": get_focus_owner().get_meta("action")})
		get_tree().set_input_as_handled()
		set_process_input(false)
	if event.is_action_pressed("ui_down") and \
			get_focus_owner() == current_actions[current_actions.size()-1] and \
			current_actions != button_stack[button_stack.size()-1]:
		refresh_actions(button_stack[button_stack.find(current_actions)+1])
		current_actions[0].grab_focus()
		get_tree().set_input_as_handled()
	if event.is_action_pressed("ui_up") and \
			get_focus_owner() == current_actions[0] and \
			current_actions != button_stack[0]:
		refresh_actions(button_stack[button_stack.find(current_actions)-1])
		current_actions[current_actions.size()-1].grab_focus()
		get_tree().set_input_as_handled()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func initialize_chara_box(character_arg, battlescreen_arg):
	battlescreen = battlescreen_arg
	character = character_arg
	
	visible = true
	$CenterContainer/nom.text = character.stat["nom"]
	
	var pv_actuel = str(character.stat["vie"])
	var pv_max = str(character.stat["VIE_MAX"])
	$VBoxContainer/VBoxContainer/pv_act.text = str(pv_actuel + "/" + pv_max)
	
	var mana_actuel = str(character.stat["mana"])
	var mana_max = str(character.stat["MANA_MAX"])
	$VBoxContainer/VBoxContainer/mana_act.text = str(mana_actuel + "/" + mana_max)
	
	var iteration = 0
	for i in range(0, character.stat["actions"].size()):
		var new_button = Button.new()
		new_button.visible = false
		new_button.text = character.stat["actions"][i]
		new_button.set_meta("action", i)
		$VBoxContainer/VBoxContainer2/VBoxContainer.add_child(new_button)
		if button_stack[iteration].size() < 4:
			button_stack[iteration].append(new_button)
		else:
			button_stack.append([])
			iteration += 1
			button_stack[iteration].append(new_button)
	refresh_actions(button_stack[0])
	current_actions[0].focus_neighbour_top = current_actions[0].get_path()
			
func refresh_actions(actions):
	for i in range(0, current_actions.size()):
		var current_button_action = current_actions[i]
		current_button_action.visible = false 
	for i in range(0, actions.size()):
		var button_action = actions[i]
		button_action.visible = true
	current_actions = actions
	
func refresh():
	var pv_actuel = str(character.stat["vie"])
	var pv_max = str(character.stat["VIE_MAX"])
	if int(pv_actuel) < 0:
		pv_actuel = "0"
	$VBoxContainer/VBoxContainer/pv_act.text = str(pv_actuel + "/" + pv_max)
	
	var mana_actuel = str(character.stat["mana"])
	var mana_max = str(character.stat["MANA_MAX"])
	if int(mana_actuel) < 0:
		mana_actuel = "0"
	$VBoxContainer/VBoxContainer/mana_act.text = str(mana_actuel + "/" + mana_max)
	
func my_grab_focus():
	current_actions[0].grab_focus()
	
func on_action_button_pressed():
	pass