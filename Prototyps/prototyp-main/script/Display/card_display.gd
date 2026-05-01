extends CanvasLayer
var Card_Skin = preload("res://scene/Card_Skin.tscn")

@onready var Display: HBoxContainer = $Display/Con_Display

func _ready() -> void:
	EventHandler.on_GUI_update.connect(update_GUI)

## ToDo: Fix :) need for new istantiation all the time ~dont know if thats good anyway
func update_GUI()-> void:

	Display.clear()
	
	for card in Data.Handcards:
		var new = Card_Skin.instantiate()	
		new.card = card
		Display.add_child(new)
	
	
	


func _on_nex_turn_pressed() -> void:
	EventHandler.on_next_Stage.emit()
