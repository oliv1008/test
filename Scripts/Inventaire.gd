extends Node2D

var inventory = []

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func add_to_inventory(node):
	print("On ajoute ", node, " à l'inventaire")
	inventory.append(node)
	
func remove_from_inventory(node):
	print("On enleve ", node, "de l'inventaire")
	inventory.remove(inventory.find(node))