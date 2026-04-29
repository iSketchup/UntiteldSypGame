class_name dayState
extends State
var Statename := 'day'

func enter(curPile):
	Get_HandCards()
	super.trigger_action("drawn")
		
func Get_HandCards():
	var Handcards : ItemList
	var Cards_count: int = 5 # Das soll in Data
	for card in range(Cards_count):
		HandCards.append(Deck[Deck.pick_random])
	Data.Handcards = Handcards
	
func exit():
	for card in card_list:
		card.triggered()

func update(delta,curPile):
	pass
	
	
