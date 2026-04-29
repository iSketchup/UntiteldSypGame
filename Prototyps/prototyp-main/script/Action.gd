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
	
@export var value: = 0.0:
	get:
		return value * countFOR()

var pile: Array[Variant] = [[[]]]

func countFOR()-> int:
	## TODO: implement one for each FOR, look for pile -> make pile in here update from card.Update()
	match FOR:
		"self": return 1 
		"neighbour": return countNeighbour()
	
	return 0
	
	
	
func countNeighbour()-> int:
	var current_card = getCard()
	for layer in pile:
		for row in layer:
			for card in row:
				if card == current_card: return 1 
	return 0


func getCard()-> Card:
	for layer in pile:
		for row in layer:
			for card in row:
				if card != null:
					for action in card.Actions:
						if action == self:
							return card
	return null

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
	call(ACTION_NAMES[action])

## Action Funcs
func DamageFlat():
	EventHandler.on_damage_flat_changed.emit(value, isBase)

func DamageMult():
	EventHandler.on_damage_mult_changed.emit(value, isBase)

func Draw():
	EventHandler.on_draw.emit(value)

func Firerate():
	EventHandler.on_firerate_changed.emit(value, isBase)

func Bulletsize():
	EventHandler.on_bulletsize_changed.emit(value, isBase)
	
func Bulletspeed():
	EventHandler.on_bulletspeed_changed.emit(value, isBase)

func Energy():
	EventHandler.on_energy_changed.emit(value, isBase)
	
func Discard():
	EventHandler.on_discard.emit(value)

func Money():
	EventHandler.on_money_changed.emit(value)

func description() -> String:
	return str(value) + "x " + ACTION_NAMES[action]
