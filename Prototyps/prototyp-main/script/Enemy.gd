extends Node
class_name Enemy

var Health: float =50 * Data.Roundcount
var DistanceTillWall = Data.WallDistance
var speed:float = 1.1 * Data.Roundcount


func Take_Damage(damage: float):
	Health -= damage
	
	
func Move():
	DistanceTillWall -= speed
	
