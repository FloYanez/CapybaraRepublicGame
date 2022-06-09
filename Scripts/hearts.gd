extends HBoxContainer

var heart_full = preload("res://assets/heart.png")
var heart_empty = preload("res://assets/heartempty.png")
enum TYPES {type1,type2} # enumera
export (TYPES) var type = TYPES.type1

func update_health(value): #cambiar la función de entrada
	match type:
		TYPES.type1:
			update.type1()
		TYPES.type2:
			update.2()
	
