extends State

var Statename := 'night'


func enter(curPile):
	super(curPile)
	
func exit():
	pass
	
func update(delta,curPile):
	super(delta,curPile)
	var card_list = get_cards_list()
	for card in card_list:
		card.triggered()
	
