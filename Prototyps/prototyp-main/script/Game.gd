extends Node2D

var DeckToLoad = Data.Deck_1

func  _ready() -> void:
	load_Deck()


func load_Deck():
	var Deck : ItemList
	for Link in DeckToLoad:
		var Card = load(Link)
		Deck.append(Card)
	Data.Deck = Deck
	
		
