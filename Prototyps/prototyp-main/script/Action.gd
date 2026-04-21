@tool
extends Resource
class_name Action

const ACTION_NAMES = [
	"DamageFlat",
	"DamageMult",
	"Draw",
	"Firerate",
	"Bulletsize",
	"Discard",
	"Money"
]

@export var isModifier: bool
@export var value: int = 0
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

func DamageFlat():
	print(str(value) + "x Flat Damage")

func DamageMult():
	print(str(value) + "x Damage Multiplier")

func Draw():
	print(str(value) + "x Cards drawn")

func Firerate():
	print(str(value) + "x Firerate")

func Bulletsize():
	print(str(value) + "x Bulletsize")

func Discard():
	print(str(value) + "x Discard")

func Money():
	print(str(value) + "x Money")
	
func description() -> String:
	return str(value) + "times " + ACTION_NAMES[action]