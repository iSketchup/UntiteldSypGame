class_name dayState
extends State
var Statename := 'day'

func enter():
	Data.populate_Drawpile()
	Get_HandCards()
		
func Get_HandCards():
	EventHandler.on_draw.emit(Data.Handsize)
	
func exit():
	super.trigger_action("triggered")

func update(delta):
	pass
	
	
