extends State

var Statename := 'night'
@onready var TimerAttack = %TimerAttack
var Enemy 


func enter():
	Enemy = make_Enemy()
	TimerAttack.start()
	TimerAttack.wait_time = Data.Firerate * Data.FirerateMod
	
	

func make_Enemy():
	return Data.Roundcount * 10
	
func exit():
	DataHelper.clean_board() 
	DataHelper.clear_hand()
	DataHelper.NextRound()
	
func update(delta):
	pass
	

func Attack():
	var damage = Data.DamageFlat * Data.DamageMult
	return


func _on_timer_attack_timeout() -> void:
	Enemy -= Attack()
