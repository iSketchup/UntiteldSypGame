extends GridContainer


var dropable = preload("res://scene/Drop_Slot.tscn")

func _ready() -> void:
	for i in columns*columns:
		add_child(dropable.instantiate())