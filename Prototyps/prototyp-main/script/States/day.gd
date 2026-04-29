class_name dayState
extends State

var Statename := 'day'
var card_list =get_cards_list()
var Deck: ItemList
var HandCards: ItemList

func enter(curPile):
	super(curPile)
	load_Deck()
	super.trigger_action(card_list,"drawn")


func load_Deck():
	for Link in Data.Deck_1:
		var Card = load(Link)
		Deck.append(Card)
		
func Get_HandCards():
	for card in Deck:
		HandCards.append(Deck.pick_random)
		
		

		
func exit():
	for card in card_list:
		card.triggered()

func update(delta,curPile):
	super(delta,curPile)
	
	
