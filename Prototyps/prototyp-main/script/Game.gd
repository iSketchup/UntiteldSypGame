extends Node2D

@onready var Display := $DisplayDaddy
var Day = $GameState/Day.new()

func  _ready() -> void:
	load_Deck()

func _process(delta: float) -> void:
	$GameState.pile = Data.pile


func load_Deck():
	for Link in Data.Deck_1:
		var Card = load(Link)
		Deck.append(Card)
		
func draw():
	pass