class_name dayState
extends State

var Statename := 'day'
# Unnötig Gerade in Display
var card_list =get_cards_list()
var Deck: ItemList
var HandCards: ItemList

func enter(curPile):
<<<<<<< Updated upstream
	super(curPile)
	Get_HandCards()
	super.trigger_action(HandCards,"drawn")
=======
	load_Deck()
	super.trigger_action(card_list,"drawn")
>>>>>>> Stashed changes

		
func Get_HandCards():
	var Cards_count: int
	for card in range(Cards_count):
		HandCards.append(Deck[Deck.pick_random])
	
	
		

		
func exit():
	for card in card_list:
		card.triggered()

func update(delta,curPile):
	pass
	
	
