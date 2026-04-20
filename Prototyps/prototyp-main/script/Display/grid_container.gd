extends GridContainer

var dropable: PackedScene = preload("res://scene/Drop_Slot.tscn")

var pile: Array = []

func _ready() -> void:
	pile.append([])
	for y in range(columns):
		pile[0].append([])
		for x in range(columns):
			pile[0][y].append(null)
			
			var temp: Node = dropable.instantiate()
			add_child(temp)
			temp.dropped.connect(_on_dropped.bind(y, x))
			temp.dragged.connect(_on_dragged.bind(y, x))

func _on_dropped(data, y, x) -> void:
	for i in range(pile.size()):
		if pile[i][y][x] == null:
			pile[i][y][x] = data
			return
	
	var new_layer = []
	for row in range(columns):
		new_layer.append([])
		for col in range(columns):
			new_layer[row].append(null)
	pile.append(new_layer)
	pile[-1][y][x] = data

func _on_dragged(y, x) -> void:
	for i in range(pile.size() - 1, -1, -1):
		if pile[i][y][x] != null:
			pile[i][y][x] = null
			return