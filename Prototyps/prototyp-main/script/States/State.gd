@abstract 
class_name State
extends Node


@abstract func enter(curPile)
	
	

@abstract func exit()
@abstract func update(delta, curPile)
	
	
func trigger_action(card_list,func_name: String):
	for card in card_list:
		card.call(func_name)



