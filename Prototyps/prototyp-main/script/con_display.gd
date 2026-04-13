extends HBoxContainer



func _can_drop_data(_pos, data):
	return data is Control
	

func _drop_data(_pos, data):
	var dad = data.get_parent()
	
	dad.remove_child(data)
	
	add_child(data)
	
