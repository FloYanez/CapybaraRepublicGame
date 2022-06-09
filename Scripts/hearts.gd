extends HBoxContainer

var heart_full = preload("res://assets/heart.png")
var heart_empty = preload("res://assets/heartempty.png")
enum TYPES {full,deplete} # enumera 1 Full, 2 deplete
export (TYPES) var type = TYPES.full

func update_health(value): #cambiar la función de entrada
	match type:
		TYPES.full:
			update_full(value)#cambiar a solo 1 update_heart con value
		TYPES.deplete:
			update_deplete(value)


func update_full(value):
	for i in self.get_child_count():
		if i < value:
			get_child(i).show()
		else:
			get_child(i).show()
			
func update_deplete(value):
	for i in self.get_child_count():
		if i < value:
			get_child(i).texture =heart_full
		else:
			get_child(i).texture =heart_empty
	
