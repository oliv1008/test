extends Control

signal state_changed

var states_stack = []
var current_state = null

var dialogue_text
var unpause_target

onready var states_map = {
	'idle': $Idle,
	'dialogue': $DialogueRect,
	'menu': $MainMenuOption,
	'inventory': $InventoryRect 
}

func _ready():
	connect("state_changed", self, "on_state_changed")
	
	states_stack.push_front($Idle)
	current_state = states_stack[0]
	_change_state('idle')

func _process(delta):
	var state_name = current_state.update(self, delta)
	if state_name:
		_change_state(state_name)

func show_dialogue(dialogue_text_arg, player):
	dialogue_text = dialogue_text_arg
	unpause_target = player
	_change_state("dialogue")

func toggle_option(player):
	unpause_target = player
	_change_state("menu")

func _input(event):
	var state_name = current_state.handle_input(self, event)
	if state_name:
		_change_state(state_name)

func _change_state(state_name):
	"""
	We use this method to:
		1. Clean up the current state with its the exit method
		2. Manage the flow and the history of states
		3. Initialize the new state with its enter method
	Note that to go back to the previous state in the states history,
	the state objects return the 'previous' keyword and not a specific
	state name.
	"""
	current_state.exit(self)

	if state_name == 'previous':
		states_stack.pop_front()
#Les états qui doivent revenir à celui précédant	
	elif state_name in ["dialogue"]:
		states_stack.push_front(states_map[state_name])
	else:
		var new_state = states_map[state_name]
		states_stack[0] = new_state

	if state_name == 'dialogue':
		$DialogueRect.initialize(dialogue_text, unpause_target)

	current_state = states_stack[0]
	if state_name != 'previous':
		# We don't want to reinitialize the state if we're going back to the previous state
		current_state.enter(self)
	emit_signal('state_changed', states_stack)
	
func on_state_changed(states_stack):
	print("current state = ", current_state)
