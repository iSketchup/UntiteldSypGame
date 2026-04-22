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
	
	var parts = text.split(' ')
	print(parts[0])
	var cur := float(parts[1])
	print(cur)
	mods +=value
	text = label+ ' ' + str(cur+value)
	
func _reset_mods():
	var cur := float(text.split(' ')[1])
	
	text = label + ' ' + str(cur-mods)
	
	mods = 0