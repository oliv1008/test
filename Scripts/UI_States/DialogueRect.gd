extends "res://Scripts/UI_States/State.gd"

onready var dialogue = $DialogueText
var unpause_target
var dialogue_text = []

func _ready():
	dialogue.connect("input_enter", self, "_on_input_enter")
	dialogue.connect("buff_end", self, "_on_buff_end")
	dialogue.connect("state_change", self, "_on_state_change")
	dialogue.connect("enter_break", self, "_on_enter_break")
	dialogue.connect("resume_break", self, "_on_resume_break")
	dialogue.connect("tag_buff", self, "_on_tag_buff")
	
func enter(host):
	show_dialogue()
	
func initialize(dialogue_text_arg, player):
	unpause_target = player
	dialogue_text = dialogue_text_arg

func show_dialogue():
	visible = true
	for texte in dialogue_text:
		dialogue.buff_text(texte)
		dialogue.buff_break()
	dialogue.set_state(dialogue.STATE_OUTPUT)
	
func _on_input_enter(s):
	print("Input Enter ",s)
	pass

func _on_buff_end():
	print("Buff End")
	dialogue.clear_text()
	visible = false
	unpause_target.unpause_player()
	$".."._change_state("previous")
	pass

func _on_state_change(i):
	print("New state: ", i)
	pass

func _on_enter_break():
	print("Enter Break")
	pass

func _on_resume_break():
	print("Resume Break")
	dialogue.clear_text()
	pass

func _on_tag_buff(s):
	print("Tag Buff ",s)
	pass