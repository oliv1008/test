extends Node

onready var MainMenu =  preload ("res://Scenes/MainMenu.tscn")
onready var FirstLevel = preload("res://Scenes/FirstLevel.tscn")
onready var BattleScreen = preload("res://Scenes/BattleScreen.tscn")

onready var Monster = preload("res://Scenes/Monsters/GodotMonster.tscn")

var ref_player
var ref_battlescreen

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func load_main_menu():
	var root = get_tree().get_root()
	var new_main_menu = MainMenu.instance()
	root.get_child(root.get_child_count() - 1).add_child(new_main_menu)
	
func load_first_level():
	var root = get_tree().get_root()
	var new_first_level = FirstLevel.instance()
	root.get_child(root.get_child_count() - 1).add_child(new_first_level)

func start_battle(player, equipe):
	var root = get_tree().get_root()
	ref_player = player
	var new_bs = BattleScreen.instance()
	ref_battlescreen = new_bs
	new_bs.initialize(equipe, [Monster.instance()])
	root.get_child(root.get_child_count() - 1).add_child(new_bs)
	
func close_battlescreen():
	ref_battlescreen.queue_free()
	ref_player.unpause_player()