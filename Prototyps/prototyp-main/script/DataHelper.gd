extends Node

## returns a list with all cards wich are currently in pile -> on field
func get_cards_list():
	var cards = []
	for layer in Data.pile:
		for row in layer:
			for card in row:
				if card != null:
					cards.append(card.card)
					
	return cards
