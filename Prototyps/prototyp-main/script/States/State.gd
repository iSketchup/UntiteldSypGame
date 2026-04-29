@abstract 
class_name State
extends Node

var pile

func enter(curPile):
	pile = curPile
	

@abstract func exit()
@abstract func update(delta, curPile)
	
	
func trigger_action(card_list,func_name: String):
	for card in card_list:
		card.call(func_name)


func get_cards_list():
	var cards = []
	for layer in pile:
		for row in layer:
			for card in row:
				if card != null:
					cards.append(card.card)
					
	return cards
