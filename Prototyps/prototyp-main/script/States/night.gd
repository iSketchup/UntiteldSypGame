extends State

var Statename := 'night'
@onready var TimerAttack = %TimerAttack
var Enemy := 0.0



func enter():
	Enemy = make_Enemy()
	TimerAttack.wait_time = Data.Firerate * Data.FirerateMod
	TimerAttack.start()
	
	
	

func make_Enemy():
	return Data.Roundcount * 10
	
func exit():
	DataHelper.clean_board() 
	DataHelper.clear_hand()
	DataHelper.Next_Round()
	TimerAttack.stop()
	
func update(delta):
	pass
	

func Attack():
	var damage = Data.DamageFlat * Data.DamageMult
	return damage


func _on_timer_attack_timeout() -> void:
	Enemy -= Attack()
	$"../../DisplayDaddy/LabelEnemy".text = "Enemy Health: " + str(Enemy)
	# TODO: UPDATE HEALTHBAR in GUI UPDATE
	print(Enemy)
