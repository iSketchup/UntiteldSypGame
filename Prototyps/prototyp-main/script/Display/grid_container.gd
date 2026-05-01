extends GridContainer

var dropable: PackedScene = preload("res://scene/Drop_Slot.tscn")

var pile : Array= Data.pile

func _ready() -> void:
	EventHandler.on_Grid_clear.connect(on_Grid_clear)

	for y in range(columns):
		pile[0].append([])
		for x in range(columns):
			pile[0][y].append(null)
			
			var temp:= dropable.instantiate()
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
	for i in range(pile.size()): 
		if pile[i][y][x] == null:
			pile[i-1][y][x] = null
			return

## TODO : this does NOT work :) should make the ui be clear again only blue rects
func on_Grid_clear():
	for child in get_children():
		for card in child.get_placed_cards():
			card.queue_free()
			