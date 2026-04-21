extends Node2D

var Cards=["res://Resource/sigmacart.tres"]
@onready var Display := $DisplayDaddy


func _ready() -> void:

	for link in Cards:
		Display.add_HandCard(link)

	

func _process(delta: float) -> void:
	$GameState.pile = $DisplayDaddy/Grid/GridContainer.pile
