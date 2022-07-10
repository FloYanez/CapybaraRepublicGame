extends Control

onready var resume = $PanelContainer/VBoxContainer/Resume
onready var exit = $PanelContainer/VBoxContainer/Exit
onready var menu = $PanelContainer/VBoxContainer/MainMenu
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	resume.connect("pressed", self, "_on_resume_pressed")
	exit.connect("pressed", self, "_on_exit_pressed")
	menu.connect("pressed", self, "_on_menu_pressed")
	visible = false

		
func _on_resume_pressed():
	get_tree().paused = false
	self.visible = false
	
func _on_exit_pressed():
	get_tree().quit() 

func _on_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/MainMenu.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
