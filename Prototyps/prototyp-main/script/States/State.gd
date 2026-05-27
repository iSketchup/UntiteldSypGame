@abstract 
class_name State
extends Node


@abstract func enter()
	
@abstract func exit()
@abstract func update(delta)
	
	
func trigger_action(func_name: String):
	var cards = DataHelper.get_cards_list()
	for card in cards:
		card.call(func_name)
