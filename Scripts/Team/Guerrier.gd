extends Node2D

var stat = {
	"nom": "Guerrier",
	"actions": ["Attaquer", "Capacites", "Objets", "Fuir", "test1", "test2"],
	"VIE_MAX" : 100,
	"MANA_MAX" : 20,
	"vie" : 100,
	"force" : 10,
	"armure" : 5,
	"mana" : 20
	}

func _ready():
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func Attaquer(monsters, target, battlescreen):
	var armure_monster = monsters[target].stat["armure"]
	var damage = stat["force"] - armure_monster
	monsters[target].stat["vie"] -= damage
	battlescreen.show_dialogue(str("Guerrier attaque le ", monsters[target].stat["nom"], " pour ", damage, " degats !"))