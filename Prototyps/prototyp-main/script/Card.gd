@tool
extends Resource

class_name Card

@export var image :Texture2D

var Description: String:
	get:
		var res = ""
		for action in Actions:
			res += "- " + action.description() + "\n"
		return res

@export_group('Triggers')
@export var onTrigger:bool = false 
@export var onBought:bool = false 
@export var onDrawn:bool = false 
@export var onPlaced:bool = false 
@export var onGotPlacedOn:bool = false 
@export var onDiscarded:bool = false 

## Card Funcs
func placed():
	if !onPlaced:
		return
	callFunc()

func trigger():
	if !onTrigger:
		return
	callFunc()

func discarded():
	if !onDiscarded:
		return
	callFunc()

func gotplacedon():
	if !onGotPlacedOn:
		return
	callFunc()
	
func drawn():
	if !onDrawn:
		return
	callFunc()

func bought():
	if !onBought:
		return
	callFunc()


@export_group("Actions")
@export var Actions: Array[Action] = []

func callFunc():
	for action in Actions:
		action.callFunc()