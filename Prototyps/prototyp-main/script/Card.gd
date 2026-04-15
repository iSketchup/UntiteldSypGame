extends Resource

class_name Card

@export var image :Texture2D

@export var Description :String

func placed():
	pass

func trigger():
	pass

func discarded():
	pass

func gotplacedon():
	pass
	
func drawn():
	pass

func bought():
	pass

### cook
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
