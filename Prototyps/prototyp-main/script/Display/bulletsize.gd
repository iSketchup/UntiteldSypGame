extends Label

var mods := 0 
var label := ''
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label = text 
	EventHandler.on_bulletsize_changed.connect(_on_changed)
	EventHandler.reset_mods.connect(_reset_mods)


func _on_changed(value, isBase):
	if !isBase:
		mods += value
	
	var cur := int(text.split(' ')[1])
	
	text = label + str(cur+value)
	
func _reset_mods():
	var cur := int(text.split(' ')[1])
	
	text = label + str(cur-mods)
	
	mods = 0