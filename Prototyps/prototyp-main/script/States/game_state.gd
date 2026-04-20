class_name StateMachine
extends Node

var states = []
var active_index := 0
var active_state: 
	get:
		return states[active_index]

func _ready():
	states = [$Day, $Night, $Shop]

func next_state():
	states[active_index].exit()
	active_index = (active_index + 1) % states.size()
	states[active_index].enter()

func _process(delta):
	states[active_index].update(delta)
