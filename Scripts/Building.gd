extends Node2D
onready var backgroundcycle = $Background/AnimationPlayer
onready var InventoryButton = $InventoryButton
onready var inventory = $CanvasLayer/InventoryMenu
onready var pause = $CanvasLayer2/Pause
onready var fade_to_anim = $black_box/AnimationPlayer
onready var apartments_ref = $Apartments
var day = true        #empieza en día
var accept_input= true
var all_gone= false
#var are_unoccupied = 0

func _process(delta):
	if Gamecontroller.money <=0:
		fade_to_anim.play("fade_to")
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Escena/gameover.tscn")
#	if all_gone:
#		get_tree().change_scene("res://Escena/victory.tscn")
	
	
func check_all_gone():
	var are_unoccupied = 0
	for inquilino in apartments_ref.get_children():
		if inquilino.unoccupied:
			are_unoccupied += 1
	if are_unoccupied==apartments_ref.get_child_count():
		fade_to_anim.play("fade_to")
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Escena/victory.tscn")
		all_gone = true
	print(all_gone)
	print(are_unoccupied)
	return all_gone
	
			
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
