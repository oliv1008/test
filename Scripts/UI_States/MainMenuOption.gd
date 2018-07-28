extends "res://Scripts/UI_States/State.gd"

var state_machine

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func handle_input(host, event):
	if event.is_action_pressed("ui_cancel"):
		return "idle"

func enter(host):
	state_machine = host
	visible = true

func _on_inventory_button_pressed():
	state_machine._change_state("inventory")
