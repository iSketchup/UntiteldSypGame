extends Control

class_name card_skin

@export var CardScaleYToViewport = 4
@export var CardScaleXToViewport := 6

func _get_drag_data(_pos):

	var preview = Panel.new()
	preview.custom_minimum_size = Vector2(size.x, size.y)
	
	for child in get_children():
		child = child.duplicate()
		preview.add_child(child)
	
	set_drag_preview(preview)

	self.hide()
	
	return self

func _notification(what):
	if what == NOTIFICATION_DRAG_END:
		show()

func _ready():
	get_viewport().size_changed.connect(_on_resize)
	_on_resize()

func _on_resize():
	var window = get_viewport().get_visible_rect().size
	custom_minimum_size = Vector2(window.x / CardScaleXToViewport, window.y / CardScaleYToViewport)
