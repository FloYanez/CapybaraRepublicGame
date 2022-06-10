extends Node2D
onready var backgroundcycle = $animated_background/AnimationPlayer
onready var InventoryButton = $InventoryButton
onready var inventory = $CanvasLayer/InventoryMenu
var day = true        #empieza en día
var accept_input= true

func _ready():
	InventoryButton.connect("pressed", self, "on_inventory_pressed")

	
func _input(event):   #func que esperara un input
	if not accept_input:#si no hay input no pasa nada
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
		

func on_inventory_pressed():
	inventory.visible = true

func on_inventory_closed():
	inventory.visible = false
