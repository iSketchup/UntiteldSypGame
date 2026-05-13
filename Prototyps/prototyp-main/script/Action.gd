@tool
extends Resource
class_name Action

enum Triggers { onTrigger, onBought, onDrawn, onPlaced, onGotPlacedOn, onDiscarded, onRoundend, onUndergroundTrigger}

@export var trigger: Triggers = Triggers.onTrigger

## Trigger Funcs
func placed():
	if trigger != Triggers.onPlaced: return
	callFunc()

func triggered():
	if trigger != Triggers.onTrigger: return
	callFunc()

func discarded():
	if trigger != Triggers.onDiscarded: return
	callFunc()

func gotplacedon():
	if trigger != Triggers.onGotPlacedOn: return
	callFunc()

func drawn():
	if trigger != Triggers.onDrawn: return
	callFunc()

func bought():
	if trigger != Triggers.onBought: return
	callFunc()

func roundend():
	if trigger != Triggers.onRoundend: return
	callFunc()
	
func undergroundtrigger():
	if trigger != Triggers.onUndergroundTrigger: return
	callFunc()



@export_group("Actions")
@export var isBase: bool = false

@export_enum(
	"self",
	'neighbour',
	'below',
	'above',
	'drawpile',
	'inhand',
	'onfield') var FOR: String = "self"
	
@export_enum(
	"none",
	'neighbour',
	'top',
	'down',
	'left',
	'right',
	'corners') var AFFECTS: String = "none"
	
@export var value: = 1.0

var internal_value: = 1.0:
	get:
		return value * countFOR()
		
var pile = Data.pile


func countFOR()-> int:
	match FOR:
		"self": return 1 
		"neighbour": return countNeighbour()
		"below": return countBelow()
		"above": return countAbove()
		"drawpile": return countDrawpile()
		"inhand": return countInhand()
		"onfield": return countOnfield()
	
	return 0
	
func affectFOR()-> void:
	match FOR:
		"none": return
		"neighbour": affectNeighbour()
		"top": affectTop()
		"down": affectDown()
		"left": affectLeft()
		"right": affectRight()
	
	return 
	
	
	
func countNeighbour()-> int:
	var c = getCard()
	var count
	var row = c.row
	var col = c.column
	
	if row > 0 and pile[0][row - 1][col] != null: 
		count += 1
	
	if row < pile[0].count() and pile[0][row + 1][col] != null: 
		count += 1
	
	if col > 0 and pile[0][row][col + 1] != null: 
		count += 1
	
	if col < pile[0][0].count() and pile[0][row][col - 1] != null: 
		count += 1
	print(count)
	return count

func countAbove()-> int:
	var c = getCard()
	var count
	
	for i in range(c.layer, pile.size()):
		if pile[i][c.row][c.column] != null: count += 1
	
	return count

func countBelow()-> int:
	var c = getCard()
	var count
	
	for i in range(0, c.layer):
		if pile[i][c.row][c.column] != null: count += 1
	
	return count
	
	
func countDrawpile()-> int:
	return Data.Drawpile.size()
	
func countInhand()-> int:
	return Data.Handcards.size()
	
func countOnfield()-> int:
	var count
	
	for layer in pile:
		for row in layer:
			for card in row:
				if card != null: count += 1
	
	return count
	
	

func getCard()-> Dictionary:
	for l in range(pile.size()):
		for r in range(pile[l].size()):
			for c in range(pile[l][r].size()):
				for card in pile[l][r][c]:
					for action in card.actions:
						if action == self:
							return {
							"layer": l,
							"row": r,
							"column": c,
							"card": card
							}
				
	return {
	"card": null,
	"layer": -1,
	"row": -1,
	"column": -1
	}
	
	
func getTopCard(column: int, row: int)-> Card:
	var layer = 0
	var card
	while true:
		card = pile[layer][row][column]
		if card == null:
			card = pile[layer - 1][row][column]
			break
		layer += 1
	return card
	
	
func affectNeighbour()-> void:
	affectTop()
	affectDown()
	affectLeft()
	affectRight()
	
	

func affectTop()-> void:
	var c = getCard()
	var layer = 0
	var card
	
	if c.row == 0: return
	while true:
		card = pile[layer][c.row - 1][c.column]
		if card == null:
			card = pile[layer - 1][c.row - 1][c.column]
			break
		layer += 1
		
	card.call("trigger")

func affectDown()-> void:
	var c = getCard()
	
	if c.row == pile[c.layer].size(): return
	var card = pile[c.layer][c.row + 1][c.column]
	card.call("trigger")

func affectLeft()-> void:
	var c = getCard()

	if c.column == 0: return
	var card = pile[c.layer][c.row][c.column - 1]
	card.call("trigger")

func affectRight()-> void:
	var c = getCard()
	
	if c.column == pile[c.layer][c.row].size(): return
	var card = pile[c.layer][c.row][c.column + 1]
	card.call("trigger")
	
func affectCorners() -> void:
	pass
					
const ACTION_NAMES = [
	"DamageFlat",
	"DamageMult",
	"Draw",
	"Firerate",
	"Bulletsize",
	"Bulletspeed",
	"Energy",
	"Discard",
	"Money"
]

var action: int = 0

func _get_property_list() -> Array[Dictionary]:
	return [{
		"name": "action",
		"type": TYPE_INT,
		"usage": PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_STORAGE | PROPERTY_USAGE_SCRIPT_VARIABLE,
		"hint": PROPERTY_HINT_ENUM,
		"hint_string": ",".join(ACTION_NAMES)
	}]

func _get(property: StringName) -> Variant:
	if property == "action": return action
	return null

func _set(property: StringName, val) -> bool:
	if property == "action":
		action = val
		return true
	return false

func callFunc():
	# TODO: jaskja
	#call(ACTION_NAMES[action])
	pass

## Action Funcs
func DamageFlat():
	EventHandler.on_damage_flat_changed.emit(internal_value, isBase)

func DamageMult():
	EventHandler.on_damage_mult_changed.emit(internal_value, isBase)

func Draw():
	EventHandler.on_draw.emit(internal_value)

func Firerate():
	EventHandler.on_firerate_changed.emit(internal_value, isBase)

func Bulletsize():
	EventHandler.on_bulletsize_changed.emit(internal_value, isBase)
	
func Bulletspeed():
	EventHandler.on_bulletspeed_changed.emit(internal_value, isBase)

func Energy():
	EventHandler.on_energy_changed.emit(internal_value, isBase)
	
func Discard():
	EventHandler.on_discard.emit(internal_value)

func Money():
	EventHandler.on_money_changed.emit(internal_value)

func description() -> String:
	## ToDo: make this look if its being held in hand if not make it display the value use internal value
	return str(value) + 'per '+ FOR + " x " + ACTION_NAMES[action]
