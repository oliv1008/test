extends KinematicBody2D

onready var equipe = [$"/root/Roster/Guerrier"]

var direction = Vector2()
var looking_position = Vector2()

const MAX_SPEED = 400

var speed = 0
var velocity = Vector2()

var target_pos = Vector2()
var target_direction = Vector2()
var is_moving = false


func _ready():
	pass


func _physics_process(delta):
	direction = Vector2()
	speed = 0

	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	elif Input.is_action_pressed("ui_down"):
		direction.y = 1

	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	elif Input.is_action_pressed("ui_right"):
		direction.x = 1
	
	if not is_moving and direction != Vector2():
		target_direction = direction.normalized()
		$LookingPos.position = Vector2(64, 64) * direction
		if !test_move(Transform2D(rotation, position), Vector2(64, 64) * direction):
			if randi() % 101 > 90:
				global.start_battle(self, equipe)
				pause_player()
			target_pos = position + Vector2(64, 64) * direction
			is_moving = true
	elif is_moving:
		speed = MAX_SPEED
		velocity = speed * target_direction * delta

		var pos = position
		var distance_to_target = pos.distance_to(target_pos)
		var move_distance = velocity.length()

		if move_distance > distance_to_target:
			velocity = target_direction * distance_to_target
			is_moving = false

		move_and_collide(velocity)
		
func _input(event):
	if event.is_action_pressed("ui_accept"):
		var overlapping_bodies = $LookingPos.get_overlapping_bodies()
		if !overlapping_bodies.empty():
			var target = overlapping_bodies[0]
			if target.is_in_group("Interactif"):
				target.interaction(self)
				pause_player()
			elif target.is_in_group("Pickup"):
				target.interaction()
			else:
				print("pas d'interaction")
	elif event.is_action_pressed("ui_cancel"):
		get_tree().set_input_as_handled()
		pause_player()
		UI.toggle_option(self)
	elif event.is_action_pressed("m"):
		print("equipe = ", equipe)
		
func pause_player():
	set_physics_process(false)
	set_process_input(false)
	
func unpause_player():
	set_physics_process(true)
	set_process_input(true)