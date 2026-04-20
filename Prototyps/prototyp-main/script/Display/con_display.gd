extends HBoxContainer

func _can_drop_data(_pos, data):
	return data is Control	

func _drop_data(_pos, data):

	
	if data.get_parent() == self:
		return
	
	data.reparent(self)
	
