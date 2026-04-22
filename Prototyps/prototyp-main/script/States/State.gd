@abstract 
class_name State
extends Node

var pile

func enter(curPile):
	pile = curPile
	
@abstract func exit()
func update(delta, curPile):
	pile = curPile

func get_cards_list():
	var cards = []
	for layer in pile:
		for row in layer:
			for card in row:
				if card != null:
					cards.append(card.card)
					
	return cards
