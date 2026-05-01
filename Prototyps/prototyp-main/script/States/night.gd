extends State

var Statename := 'night'


func enter():
	pass
	
func exit():
	DataHelper.clean_board() 
	DataHelper.clear_hand()
	
func update(delta):
	pass
	
