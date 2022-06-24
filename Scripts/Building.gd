extends Node2D
onready var backgroundcycle = $Background/AnimationPlayer
onready var InventoryButton = $InventoryButton
onready var inventory = $CanvasLayer/InventoryMenu
onready var pause = $CanvasLayer2/Pause
var day = true        #empieza en día
var accept_input= true

func _ready():
	InventoryButton.connect("pressed", self, "on_inventory_pressed")
	Gamecontroller.background = backgroundcycle
	Gamecontroller.building = self
	
func _input(event):
	if not accept_input:#si no hay input no pasa nada
		return
	
	if event.is_action_pressed("pause") and not event.is_echo():
		get_tree().paused = true
		pause.visible = true

func on_inventory_pressed():
	inventory.visible = true

func on_inventory_closed():
	inventory.visible = false
