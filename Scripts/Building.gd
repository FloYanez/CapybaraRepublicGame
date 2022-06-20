extends Node2D
onready var backgroundcycle = $Background/AnimationPlayer
onready var InventoryButton = $InventoryButton
onready var inventory = $CanvasLayer/InventoryMenu
onready var pause = $CanvasLayer2/Pause
var day = true        #empieza en día
var accept_input= true

func _ready():
	InventoryButton.connect("pressed", self, "on_inventory_pressed")
	
func _input(event):
	if not accept_input:#si no hay input no pasa nada
		return
	
	if event.is_action_pressed("pause") and not event.is_echo():
		get_tree().paused = true
		pause.visible = true
		
	elif event.is_action_pressed('w'):
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
		
func _on_action_passed():
	if not accept_input:#si no hay input no pasa nada
		return
	print("action_counter: ", Gamecontroller.action_counter)
	print("cambio de escena")
	accept_input= false
	if day:
		print("dia a noche")
		backgroundcycle.play("Day")
	else:
		print("noche a dia")
		backgroundcycle.play_backwards("Day") 
	day = not day
	yield(backgroundcycle,"animation_finished")#espera la ejecución de código
	accept_input=true

func on_inventory_pressed():
	inventory.visible = true

func on_inventory_closed():
	inventory.visible = false
