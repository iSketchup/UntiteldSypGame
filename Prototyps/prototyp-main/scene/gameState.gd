extends Node2D

var Cards=["res://Resource/Giver.tres"]
@onready var Display = $DisplayDaddy

func _ready() -> void:
	for link in Cards:
		Display.add_HandCard(link)
