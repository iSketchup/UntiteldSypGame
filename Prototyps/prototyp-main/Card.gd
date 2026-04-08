extends Resource

class_name Card

@export var image :Image

@export var Description :String

func place():
	pass

func  trigger():
	pass
	
func mogg():
	print("mogged")

	
enum aura {
	arscg,
	sigma,
	mogg
}

@export var x : aura
