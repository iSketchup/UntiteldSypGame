extends Node
## Signals
signal on_damage_flat_changed(value: int, is_base: bool)
signal on_damage_mult_changed(value: int, is_base: bool)
signal on_firerate_changed(value: int, is_base: bool)
signal on_bulletsize_changed(value: int, is_base: bool)
signal on_bulletspeed_changed(value: int, is_base: bool)
signal on_energy_changed(value: int, is_base: bool)
signal on_money_changed(value: int)

signal on_draw(value: int)

signal on_discard(value: int)


signal on_GUI_update()
signal on_Grid_clear()

signal reset_mods

signal on_next_Stage()

func initStats() -> void:
	on_damage_flat_changed.emit(3,1)
	on_damage_mult_changed.emit(1,1)
	on_firerate_changed.emit(4,1)
	on_bulletsize_changed.emit(3,1)
	on_bulletspeed_changed.emit(3,1)
