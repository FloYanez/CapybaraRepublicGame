extends Node2D
onready var backgroundcycle = $animated_background/AnimationPlayer
var day = true
var accept_input= true
func _input(event):
	if not accept_input:
		return
	if event.is_action_pressed('w'):
		accept_input= false
		Gamecontroller.action_counter +=1
		if Gamecontroller.action_counter ==2:
			if day:
				backgroundcycle.play("Day")
			else:
				backgroundcycle.play_backwards("Day")
			Gamecontroller.action_counter = 0 
			day = not day
			yield(backgroundcycle,"animation_finished")#espera la ejecución de código
		accept_input=true
