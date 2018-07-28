extends "res://Scripts/UI_States/State.gd"

var unpause_player

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func enter(host):
	print("on ferme le menu")
	$"..".set_process_input(false)
	$"../MainMenuOption".visible = false
	if unpause_player != null:
		unpause_player.unpause_player()
	
func exit(host):
	unpause_player = host.unpause_target
	$"..".set_process_input(true)