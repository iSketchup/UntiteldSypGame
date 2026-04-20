extends Resource

class_name Card

@export var image :Texture2D

@export var Description :String






## Card Funcs
func placed():
	pass

func trigger():
	print('triggered')
	callFunc()

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
	print("Damage")
	
func MoreCards():
	print('cards++')
	
func MoreEnergie():
	print('Energy ++')
	
enum actions {
	MakeDamage,
	MoreCards,
	MoreEnergie,
	mogg
}

@export var Action: actions


func callFunc():	
	call(actions.keys()[Action])
