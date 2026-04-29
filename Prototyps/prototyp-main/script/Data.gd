extends Node


var Deck_1 =["res://Resource/sigmacart.tres"]
var Handcards = []

var pile: Array[Variant]

func get_cards_list():
	var cards = []
	for layer in pile:
		for row in layer:
			for card in row:
				if card != null:
					cards.append(card.card)
					
	return cards