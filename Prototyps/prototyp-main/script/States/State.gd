@abstract 
class_name State
extends Node

var pile

func enter(curPile):
	pile = curPile
	
@abstract func exit()
func update(delta, curPile):
	pile = curPile