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

## Card Funcs
func placed():
	for action in Actions:
		action.placed()


func triggered():
	for action in Actions:
		action.triggered()


func discarded():
	for action in Actions:
		action.discarded()


func gotplacedon():
	for action in Actions:
		action.gotplacedon()

	
func drawn():
	for action in Actions:
		action.drawn()


func bought():
	for action in Actions:
		action.bought()


@export_group("Actions")
@export var Actions: Array[Action] = []
