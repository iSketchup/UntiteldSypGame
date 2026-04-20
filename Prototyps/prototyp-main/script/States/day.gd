extends State

var Statename := 'day'


func enter(curPile):
	super(curPile)
	
func exit():
	print(pile)
	for layer_z in range(pile.size()):
		var layer = pile[layer_z]
		for card_y in range(layer.size()):
			var row :Array= layer[card_y] 
			for card_x in range(row.size()):
				var card :Card= row[card_x]
				if card == null:
					continue
				card.trigger()
				
	
		
	
func update(delta,curPile):
	super(delta,curPile)
