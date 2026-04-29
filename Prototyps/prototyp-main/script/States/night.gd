extends State

var Statename := 'night'


func enter(curPile):
	pass
	
func exit():
	pass
	
func update(delta,curPile):
	var card_list = get_cards_list()
	for card in card_list:
		card.triggered()
	
