extends "res://Scripts/WorldObject.gd"

var dialogue_text = ["Bonjour !", "Ceci est une interaction", "Au revoir"]

func _ready():
	add_to_group("Interactif")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func interaction(player):
	UI.show_dialogue(dialogue_text, player)