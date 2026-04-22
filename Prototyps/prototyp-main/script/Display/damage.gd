extends Label

var mods := 0 
var label := ''

func _ready() -> void:
	label = text 
	EventHandler.on_damage_flat_changed.connect(_on_changed)
	EventHandler.reset_mods.connect(_reset_mods)


func _on_changed(value, isBase):
	if !isBase:
		mods += value
	print(value)
	var cur := int(text.split(' ')[1])
	text = label + str(cur+value)
	
func _reset_mods():
	var cur := int(text.split(' ')[1])
	text = label + str(cur-mods)
	print(mods)
	mods = 0
	
