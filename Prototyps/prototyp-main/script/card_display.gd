extends CanvasLayer
var Card_Skin = preload("res://scene/Card_Skin.tscn")

var Hand =  []

@onready var Display = $Display/Con_Display


func add_HandCard(link: String)-> void:
	var card_resource = load(link)
	var new = Card_Skin.instantiate()
	
	var cover:TextureRect = new.find_child('Cover')
	cover.texture = card_resource.image
	var Description:RichTextLabel =new.find_child('Description')
	Description.text = card_resource.Description
	
	Display.add_child(new)
	Hand.append(new)
	

func _get_drag_data(_pos):

	var preview = duplicate()
	preview.modulate.a = 0.6
	
	var cr := ColorRect.new()
	cr.color = Color.ORANGE_RED
	cr.custom_minimum_size = Vector2(200, 100)
	
	preview.add_child(cr)
	## set_drag_preview(preview)
	
	print('Ive been touched')
	
	return self



func _can_drop_data(_pos, data):
	return typeof(data) == typeof(Card_Skin)
	

func _drop_data(_pos, data):
	var dad = data.get_parent()
	
	dad.remove_child(data)
	
	Display.add_child(data)
