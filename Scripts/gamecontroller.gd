extends Node
var action_counter=0
var current_action_count = 0
var _current_action setget set_current_action
var _legend = "Esta casilla está vacía."
var tenants_apartments = []
var day = true
var background = null
var building = null

func set_current_action(action):
	_current_action = action
	while tenants_apartments.size() > 6:
		tenants_apartments.pop_front()
	for i in tenants_apartments:
		i.apply_button.visible = true
		
func use_action():
	current_action_count +=1
	if current_action_count == 2 :
		while tenants_apartments.size() > 6:
			tenants_apartments.pop_front()
		for i in tenants_apartments:
			i.apply_button.visible = false
		current_action_count = 0
	increase_action_counter()
			
func increase_action_counter():
	action_counter +=1
	if action_counter ==2:
		if day:
			background.play("Day")
		else:
			background.play_backwards("Day")
		action_counter = 0 
		day = not day
		yield(background,"animation_finished")#espera la ejecución de código



