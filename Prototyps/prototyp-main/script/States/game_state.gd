# StateMachine.gd
class_name StateMachine
extends Node


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
		Data.DamageFlat += value
	else:
		Data.DamageFlatMod += value


func _on_damage_mult_changed(value: int, is_base: bool) -> void:
	if is_base:
		Data.DamageMult += value
	else:
		Data.DamageMultMod += value


func _on_firerate_changed(value: int, is_base: bool) -> void:
	if is_base:
		Data.Firerate += value
	else:
		Data.FirerateMod += value


func _on_bulletsize_changed(value: int, is_base: bool) -> void:
	if is_base:
		Data.Bulletsize += value
	else:
		Data.BulletsizeMod += value


func _on_bulletspeed_changed(value: int, is_base: bool) -> void:
	if is_base:
		Data.Bulletspeed += value
	else:
		Data.BulletspeedMod += value


func _on_energy_changed(value: int, is_base: bool) -> void:
	if is_base:
		Data.Energy += value
	else:
		Data.EnergyMod += value


func _on_money_changed(value: int) -> void:
	Data.Money += value


func reset_mods():
	Data.DamageFlatMod = 0
	Data.DamageMultMod = 0
	Data.BulletsizeMod = 0
	Data.BulletspeedMod = 0


func _on_discard(value: int) -> void:
	pass


func _on_draw(value: int) -> void:
	for i in range(value):
		Data.Handcards.append(Data.Deck[pick_random])