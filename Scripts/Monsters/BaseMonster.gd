extends Node2D

var stat = {
	"nom": "Godot",
	"VIE_MAX": 50,
	"vie": 10,
	"MANA_MAX": 10,
	"mana": 10,
	"force": 10,
	"armure": 1,
	"experience": 1
}

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func IA(monsters, players, battlescreen):
	print("le monstre attaque")
	var armure_cible = players[0].stat["armure"]
	var damage = stat["force"] - armure_cible
	players[0].stat["vie"] -= damage
	battlescreen.show_dialogue(str("Godot attaque le ", players[0].stat["nom"], " pour ", damage, " degats !"))