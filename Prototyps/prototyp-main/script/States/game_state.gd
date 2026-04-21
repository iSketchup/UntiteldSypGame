class_name StateMachine
extends Node

var pile

var Money

var Handsize
var HandsizeMod
var DamageFlat
var DamageFlatMod
var DamageMult
var DamageMultMod
var Firerate
var FirerateMod
var Bulletsize
var BulletsizeMod
var Bulletspeed
var BulletspeedMod


var states: Array[State] = []
var active_index := 0
var active_state: 
	get:
		return states[active_index]

func _ready():
	states = [$Day, $Night, $Shop]

func next_state():
	states[active_index].exit()
	active_index = (active_index + 1) % states.size()
	states[active_index].enter(pile)
	$"../DisplayDaddy/Label".text = active_state.Statename

func _process(delta):
	states[active_index].update(delta, pile)


func _on_display_daddy_next() -> void:
	next_state()
