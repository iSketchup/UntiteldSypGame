extends Node2D

@onready var Display := $DisplayDaddy
var Day = $GameState/Day.new()

func  _ready() -> void:
	load_Deck()


func load_Deck():
	var Deck : ItemList
	for Link in Data.Deck_1:
		var Card = load(Link)
		Deck.append(Card)
	Data.Deck = Deck
	
		
