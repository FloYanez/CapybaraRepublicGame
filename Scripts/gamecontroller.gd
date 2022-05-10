extends Node
var action_counter=0
var _legend = "Esta casilla está vacía."
onready var inventory = get_node("../ActionsMenu")
func set_legend(value):
	_legend = str(value)
	inventory.set_legend(_legend)
	
	
