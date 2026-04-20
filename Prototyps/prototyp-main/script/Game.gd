extends Node2D

var Cards=["res://Resource/Giver.tres","res://Resource/MonsterEnergie.tres","res://resource/ligma.tres","res://resource/XBow.tres"]
@onready var Display := $DisplayDaddy


func _ready() -> void:
	for link in Cards:
		Display.add_HandCard(link)


func _process(delta: float) -> void:
	$GameState.pile = $DisplayDaddy/Grid/GridContainer.pile