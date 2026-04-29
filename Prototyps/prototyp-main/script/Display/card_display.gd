extends CanvasLayer
var Card_Skin = preload("res://scene/Card_Skin.tscn")

@onready var Display = $Display/Con_Display

func _ready() -> void:
	EventHandler.on_draw.connect(add_HandCard)

func add_HandCard(link: String)-> void:

	var card_resource = load(link)
	var new = Card_Skin.instantiate()
	
	new.card = card_resource
	
	Display.add_child(new)
	
	


func _on_nex_turn_pressed() -> void:
	EventHandler.on_next_Stage.emit()
