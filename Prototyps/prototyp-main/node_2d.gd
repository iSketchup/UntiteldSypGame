extends Node2D

var card;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	card = load("res://ligma.tres")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	card.(card.x)()
