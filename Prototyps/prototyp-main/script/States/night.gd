extends State

var Statename := 'night'
@onready var TimerAttack = %TimerAttack
var enemy : Enemy
var Health: float
@onready var rect = $"../../DisplayDaddy/Panel/ColorRectEnemyHealth"
var MaxHealth
var maxwidth = 280



func enter():
	enemy = Enemy.new()
	Health = Data.Health
	MaxHealth = enemy.Health	
	rect.size.x = maxwidth 
	
	# TODO: Soll Gut gebalanced sein
	TimerAttack.wait_time =10/( Data.Firerate * Data.FirerateMod)
	TimerAttack.start()


func exit():
	DataHelper.clean_board() 
	DataHelper.clear_hand()
	DataHelper.Next_Round()
	
func update(delta):
	pass
	

func Attack():
	var damage = Data.DamageFlat * Data.DamageMult
	print(damage)
	print("Data" + str(Data.DamageMult))
	return damage


func _on_timer_attack_timeout() -> void:
	$"../../DisplayDaddy/LabelEnemy".text = "Enemy Health: " + str(enemy.Health)
	
	var procent = enemy.Health/MaxHealth
	enemy.Take_Damage(Attack())
	enemy.Move()
	rect.size.x = maxwidth * procent
	if (enemy.DistanceTillWall <= 0 or enemy.Health <= 0):
		TimerAttack.stop()
	
	
