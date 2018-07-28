extends "res://Scripts/WorldObject.gd"

var name_inventory = "Potion"
onready var inventory = $"/root/Inventaire"

func _ready():
	add_to_group("Pickup")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _exit_tree():
	Inventaire.add_to_inventory(self)

func interaction():
	get_parent().remove_child(self)
#	call_deferred("add_to_inventory")
	
func on_use():
	print("Une potion vient d'être utilisé !")
	Inventaire.remove_from_inventory(self)
	nc.post_notification("inventory_modified", null)
	
func add_to_inventory():
	Inventaire.add_to_inventory(self)