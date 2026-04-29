@abstract 
class_name State
extends Node


@abstract func enter()
	
@abstract func exit()
@abstract func update(delta)
	
	
func trigger_action(func_name: String):
	for card in Data.Handcards:
		card.call(func_name)
