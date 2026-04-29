extends Node2D

@onready var Display := $DisplayDaddy
var Day = new($GameState/Day)

func _ready() -> void:

	for link in Cards:
		Display.add_HandCard(link)

	

func _process(delta: float) -> void:
	$GameState.pile = $DisplayDaddy/Grid/GridContainer.pile
