extends Node
var action_counter=0
var current_action_count = 0
var on_action = false
var _current_action setget set_current_action
var _legend = "Esta casilla está vacía."
var tenants_apartments = []

func set_current_action(action):
	_current_action = action
	if on_action == false:
		action_counter += 1
	while tenants_apartments.size() > 6:
		tenants_apartments.pop_front()
	for i in tenants_apartments:
		i.apply_button.visible = true
	on_action = true
		
func use_action():
	current_action_count +=1
	if current_action_count == 2 :
		while tenants_apartments.size() > 6:
			tenants_apartments.pop_front()
		for i in tenants_apartments:
			i.apply_button.visible = false
		current_action_count = 0
		on_action = false
		if action_counter ==  2:
			Building._on_action_passed()
			action_counter = 0
