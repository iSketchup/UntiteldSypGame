extends Container


@export var CardScaleYToViewport = 4
@export var CardScaleXToViewport := 6

signal dropped
signal dragged

func _can_drop_data(_pos, data):
	return data is Control

func _drop_data(_pos, data):
	if data.get_parent() == self:
		return
	data.reparent(self)

	dropped.emit(data)


func _notification(what):
	if what == NOTIFICATION_DRAG_BEGIN:
		dragged.emit()

func _ready():
	get_viewport().size_changed.connect(_on_resize)
	_on_resize()

func _on_resize():	
	var window := get_viewport().get_visible_rect().size
	custom_minimum_size = Vector2(window.x / CardScaleXToViewport, window.y / CardScaleYToViewport)
	$ColorRect.custom_minimum_size = Vector2(window.x / CardScaleXToViewport, window.y / CardScaleYToViewport)

