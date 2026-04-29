class_name dayState
extends State

var Statename := 'day'
# Unnötig Gerade in Display
var card_list =get_cards_list()
var Deck: ItemList
var HandCards: ItemList

func enter(curPile):
	super(curPile)
	load_Deck()
	Get_HandCards()
	super.trigger_action(HandCards,"drawn")


func load_Deck():
	for Link in Data.Deck_1:
		var Card = load(Link)
		Deck.append(Card)
		
func Get_HandCards():
	var Cards_count: int
	for card in range(Cards_count):
		HandCards.append(Deck[Deck.pick_random])
		
		

		
func exit():
	for card in card_list:
		card.triggered()

func update(delta,curPile):
	super(delta,curPile)
	
	
