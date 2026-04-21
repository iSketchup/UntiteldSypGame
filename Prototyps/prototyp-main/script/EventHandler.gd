extends Node



## Signals
signal on_damage_flat_changed(value: int, is_base: bool)
signal on_damage_mult_changed(value: int, is_base: bool)
signal on_firerate_changed(value: int, is_base: bool)
signal on_bulletsize_changed(value: int, is_base: bool)
signal on_money_changed(value: int)

signal on_draw(value: int)
signal on_discard(value: int)

signal reset_mods

signal on_next_Stage()