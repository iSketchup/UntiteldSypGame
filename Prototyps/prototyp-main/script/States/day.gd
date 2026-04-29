class_name dayState
extends State
var Statename := 'day'

func enter():
	Get_HandCards()
	super.trigger_action("drawn")
		
func Get_HandCards():
	EventHandler.on_draw.emit(Data.Handsize)
	
func exit():
	for card in DataHelper.get_cards_list():
		card.triggered()

func update(delta):
	pass
	
	
