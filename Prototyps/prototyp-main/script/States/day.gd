class_name dayState
extends State

var Statename := 'day'


func enter(curPile):
	super(curPile)
	
func exit():
	for card in get_cards_list():
		card.triggered()
	
func update(delta,curPile):
	super(delta,curPile)
