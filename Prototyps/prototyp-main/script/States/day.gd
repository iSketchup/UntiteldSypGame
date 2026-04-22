class_name dayState
extends State

var Statename := 'day'


func enter(curPile):
	super(curPile)
	
func exit():
	var card_list =get_cards_list()
	for card in card_list:
		card.triggered()
	
func update(delta,curPile):
	super(delta,curPile)
