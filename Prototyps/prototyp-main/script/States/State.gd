@abstract 
class_name State
extends Node

var pile

var StateName

func enter(curPile):
	pile = curPile
	
@abstract func exit()
func update(delta, curPile):
	pile = curPile