@tool
extends Resource

class_name Card

@export var image :Texture2D

@export var Description :String

@export_group('Triggers')
@export var onTrigger:bool = false 
@export var onBought:bool = false 
@export var onDrawn:bool = false 
@export var onPlaced:bool = false 
@export var onGotPlacedOn:bool = false 
@export var onDiscarded:bool = false 




## Card Funcs
func placed():
	if !onPlaced:
		return
	callFunc()

func trigger():
	if !onTrigger:
		return
	callFunc()

func discarded():
	if !onDiscarded:
		return
	callFunc()

func gotplacedon():
	if !onGotPlacedOn:
		return
	callFunc()
	
func drawn():
	if !onDrawn:
		return
	callFunc()

func bought():
	if !onBought:
		return
	callFunc()


const FLAGS: Array[String] = ['MakeDamage','MoreCards','MoreEnergie','mogg']  # <-- nur hier ändern

var Actions: Array[String] = []
var _Actions_bits: int = 0

func _get_property_list() -> Array[Dictionary]:
	return [
		{
			"name": "Actions Picker",
			"type": TYPE_NIL,
			"usage": PROPERTY_USAGE_GROUP,
			"hint_string": ""  # pflichtfeld, auch wenn leer
		},
		{
			"name": "_Actions_bits",
			"type": TYPE_INT,
			"usage": PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_STORAGE | PROPERTY_USAGE_SCRIPT_VARIABLE,
			"hint": PROPERTY_HINT_FLAGS,
			"hint_string": ",".join(FLAGS)
		}
	]

func _get(property: StringName):
	if property == "_Actions_bits":
		return _Actions_bits

func _set(property: StringName, value) -> bool:
	if property == "_Actions_bits":
		_Actions_bits = value
		Actions = []
		for i in FLAGS.size():
			if value & (1 << i):
				Actions.append(FLAGS[i])
		return true
	return false
	
### cook
func mogg():
	print("mogged")

func MakeDamage():
	print("Damage")
	
func MoreCards():
	print('cards++')
	
func MoreEnergie():
	print('Energy ++')


func callFunc():
	for action in Actions:
		call(action)