extends Node
var action_counter=0
var current_action_count = 0
var money= 15000 #setget set_money
var _current_action setget set_current_action
var _legend = "Esta casilla está vacía."
var tenants_apartments = []
var day = true
var background = null
var building = null
onready var moneycounter = preload("res://Scripts/moneycounter.gd")

#func _ready():
#	moneycounter.coin_spin()
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
#	price_decrease()
			
func increase_action_counter():
	action_counter +=1
	if action_counter ==2:
		if day:
			background.play("Day")
		else:
			background.play_backwards("Day")
			money -=5000 
			moneycounter.coin_spin()
		action_counter = 0 
		day = not day
		yield(background,"animation_finished")#espera la ejecución de código



#func set_money(value):
#	money = value
#	money_count.value= money
#func price_decrease():
##func _ready():
#	if Input.is_action_just_pressed("minus") and money > 0: #and just_pressed:
#		money -=100
#		set_money(money)
#	





