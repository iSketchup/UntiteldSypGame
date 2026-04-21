class_name StateMachine
extends Node

var pile

var Money

var Handsize 		:= 8
var HandsizeMod 	:= 0

var DamageFlat		:= 3
var DamageFlatMod	:= 0

var DamageMult		:= 1
var DamageMultMod	:= 0

var Firerate		:= 4
var FirerateMod		:= 0

var Bulletsize		:= 3
var BulletsizeMod	:= 0

var Bulletspeed		:= 3
var BulletspeedMod	:= 0


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
