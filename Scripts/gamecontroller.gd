extends Node
var action_counter=0
var on_action = false
var _current_action setget set_current_action
var _legend = "Esta casilla está vacía."
var tenants_apartments = []

func set_current_action(action):
	_current_action = action
	on_action = true
	print(_current_action)
	while Gamecontroller.tenants_apartments.size() > 6:
		Gamecontroller.tenants_apartments.pop_front()
	for i in tenants_apartments:
		print(i)
		i.apply_button.visible = true
