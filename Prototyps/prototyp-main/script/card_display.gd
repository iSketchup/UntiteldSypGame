extends CanvasLayer
var Card_Bones = preload("res://scene/Card_Bones.tscn")


@onready var Display = $Control/Con_Display

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_HandCard(link: String)-> void:
	var card_resource = load(link)
	var new = Card_Bones.instantiate()
	
	var cover:TextureRect = new.find_child('Cover')
	cover.texture = card_resource.image
	var Description:RichTextLabel =new.find_child('Description')
	Description.text = card_resource.Description
	
	Display.add_child(new)
