# StateMachine.gd
class_name StateMachine
extends Node

var pile
var Money			:= 0

var Energy			:= 0
var EnergyMod			:= 0

var Handsize        := 8
var HandsizeMod     := 0

var DamageFlat      := 0
var DamageFlatMod   := 0

var DamageMult      := 0
var DamageMultMod   := 0

var Firerate        := 0
var FirerateMod     := 0

var Bulletsize      := 0
var BulletsizeMod   := 0

var Bulletspeed     := 0
var BulletspeedMod  := 0

var states: Array[State] = []
var active_index := 0
var active_state:
	get:
		return states[active_index]

func _ready():
	states = [$Day, $Night, $Shop]
	
	EventHandler.reset_mods.connect(reset_mods)

	EventHandler.on_damage_flat_changed.connect(_on_damage_flat_changed)
	EventHandler.on_damage_mult_changed.connect(_on_damage_mult_changed)
	EventHandler.on_firerate_changed.connect(_on_firerate_changed)
	EventHandler.on_bulletsize_changed.connect(_on_bulletsize_changed)
	EventHandler.on_bulletspeed_changed.connect(_on_bulletspeed_changed)
	EventHandler.on_money_changed.connect(_on_money_changed)
	EventHandler.on_energy_changed.connect(_on_energy_changed)
	
	
	EventHandler.on_next_Stage.connect(next_state)
	
	EventHandler.on_draw.connect(_on_draw)
	EventHandler.on_discard.connect(_on_discard)
	
	EventHandler.initStats()

func next_state():
	states[active_index].exit()
	active_index = (active_index + 1) % states.size()
	states[active_index].enter(pile)
	$"../DisplayDaddy/Label".text = active_state.Statename

func _process(delta):
	states[active_index].update(delta, pile)


# --- Signal Handler ---

func _on_damage_flat_changed(value: int, is_base: bool) -> void:
	if is_base:
		DamageFlat += value
	else:
		DamageFlatMod += value

func _on_damage_mult_changed(value: int, is_base: bool) -> void:
	if is_base:
		DamageMult += value
	else:
		DamageMultMod += value


func _on_firerate_changed(value: int, is_base: bool) -> void:
	if is_base:
		Firerate += value
	else:
		FirerateMod += value

func _on_bulletsize_changed(value: int, is_base: bool) -> void:
	if is_base:
		Bulletsize += value
	else:
		BulletsizeMod += value
		
func _on_bulletspeed_changed(value: int, is_base: bool) -> void:
	if is_base:
		Bulletspeed += value
	else:
		BulletspeedMod += value
		

func _on_energy_changed(value: int, is_base: bool) -> void:
	if is_base:
		Energy += value
	else:
		EnergyMod += value

func _on_money_changed(value: int) -> void:
	Money += value


func reset_mods():
	DamageFlatMod = 0
	DamageMultMod = 0
	BulletsizeMod = 0
	BulletspeedMod = 0

func _on_discard(value: int) -> void:
	pass

func _on_draw(value: int) -> void:
	pass
