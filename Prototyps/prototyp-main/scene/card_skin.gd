extends Control

func _get_drag_data(_pos):
	
	var preview = duplicate()
	preview.modulate.a = 0.6

	set_drag_preview(preview)
	
	print('Ive been touched')
	
	return self


func _gui_input(event):
	print("Card bekommt Event")
