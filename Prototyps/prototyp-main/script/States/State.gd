@abstract 
class_name State
extends Node


@abstract func enter(curPile)
	
	

@abstract func exit()
@abstract func update(delta, curPile)
	
	
func trigger_action(func_name: String):
	for card in Data.Deck:
		card.call(func_name)



