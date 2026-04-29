extends Node

func get_cards_list():
	var cards = []
	for layer in Data.pile:
		for row in layer:
			for card in row:
				if card != null:
					cards.append(card.card)
					
	return cards