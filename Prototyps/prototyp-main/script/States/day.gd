class_name dayState
extends State

var Statename := 'day'
var card_list =get_cards_list()


func enter(curPile):
	super(curPile)
	
	
	super.trigger_action(card_list,"drawn")


func laod_Deck():
	var HandCards
	for Link in Data.Deck_1:
		Data.Deck_1
func exit():
	for card in card_list:
		card.triggered()

func update(delta,curPile):
	super(delta,curPile)
	
	
