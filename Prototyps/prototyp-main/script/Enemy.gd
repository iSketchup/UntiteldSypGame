extends Node
class_name Enemy

var Health: float
var Damage: float
var speed:float
func _ready() -> void:
	Health = 50 * Data.Roundcount
	Damage = 5 * Data.Roundcount
	speed = 1.2 * Data.Roundcount


func Take_Damage(damage: float):
	Health -= damage
	
	
func Attack():
	return Damage