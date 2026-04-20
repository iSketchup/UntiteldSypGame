extends CanvasLayer
var Card_Skin = preload("res://scene/Card_Skin.tscn")

var Hand =  []

@onready var Display = $Display/Con_Display

signal next

func add_HandCard(link: String)-> void:
	var card_resource = load(link)
	var new = Card_Skin.instantiate()
	
	var cover:TextureRect = new.find_child('Cover')
	cover.texture = card_resource.image	
	var Description:RichTextLabel =new.find_child('Description')
	Description.text = card_resource.Description
	
	Display.add_child(new)
	Hand.append(new)
	


func _on_nex_turn_pressed() -> void:
	next.emit()