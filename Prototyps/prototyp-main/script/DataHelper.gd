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
	
## clears all cards from pile
func clean_board():
	for layer in Data.pile:
		for row in layer:
			for card in row:
				card = null
## TODO: this needs to effect the grid (the ui thingy) too

func clear_hand():
	Data.Handcards.clear()
	EventHandler.on_GUI_update.emit()