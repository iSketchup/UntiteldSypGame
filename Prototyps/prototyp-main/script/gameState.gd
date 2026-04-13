extends Node2D

var Cards=["res://Resource/Giver.tres","res://resource/EnergieSchub.tres","res://resource/ligma.tres","res://resource/XBow.tres"]
@onready var Display = $DisplayDaddy

func _ready() -> void:
	for link in Cards:
		Display.add_HandCard(link)
