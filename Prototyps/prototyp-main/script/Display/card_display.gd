extends CanvasLayer
var Card_Skin = preload("res://scene/Card_Skin.tscn")

@onready var Display = $Display/Con_Display

func _ready() -> void:
	EventHandler.on_draw.connect(add_HandCard)

## ToDo: Fix :) will flood the display also no need for new istantiation all the time
func add_HandCard(addedCards:int)-> void:
	for card in Data.Deck:
		var new = Card_Skin.instantiate()	
		new.card = card
		Display.add_child(new)
	
	
	


func _on_nex_turn_pressed() -> void:
	EventHandler.on_next_Stage.emit()
