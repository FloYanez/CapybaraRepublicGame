extends HBoxContainer

var heart_full = preload("res://assets/heart.png")
var heart_empty = preload("res://assets/heartempty.png")

func update_deplete(value):
	for i in self.get_child_count():
		if i < value:
			get_child(i).texture =heart_full
		else:
			get_child(i).texture =heart_empty
	




