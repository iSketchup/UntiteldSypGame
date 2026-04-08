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

func MakeDamage():
	print("+5 Damage")
	
func MoreCards():
	pass
	
func MoreEnergie():
	pass
	
enum actions {
	MakeDamage,
	MoreCards,
	MoreEnergie,
	mogg
}

@export var Action: actions


func callFunc():
	call(actions.keys()[Action])
