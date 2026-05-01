extends HBoxContainer

func _can_drop_data(_pos, data):
	return data is Control	

func _drop_data(_pos, data):

	
	if data.get_parent() == self:
		return
	
	## TODO: pile and hand need to be updated hier i think
	data.reparent(self)

func clear():
	for child in get_children():
		child.queue_free() ## TODO: important ts fucks
