extends "res://Scripts/UI_States/State.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	nc.add_observer(self, "inventory_modified", "on_inventory_modified")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func handle_input(host, event):
	if event.is_action_pressed("ui_cancel"):
		return "menu"
		
func exit(host):
	visible = false

func enter(host):
	visible = true
	for item in Inventaire.inventory:
		$ItemList.add_item(item.name_inventory)

func reload_inventory():
	$ItemList.clear()
	for item in Inventaire.inventory:
		$InventoryRect/ItemList.add_item(item.name_inventory)

func _on_ItemList_item_activated(index):
	print("Inventaire.inventory = ", Inventaire.inventory)
	Inventaire.inventory[index].on_use()
	
func on_inventory_modified(observer, notificationName, notificationData):
	reload_inventory()
