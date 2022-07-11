extends Control

onready var menu = $menu
onready var exit = $exit
onready var fade_anim= $CanvasLayer/black_box
#onready var credits = $PanelContainer/VBoxContainer/Credits
## Called when the node enters the scene tree for the first time.
func _ready():
	menu.connect("pressed", self, "_on_menu_pressed")
	exit.connect("pressed", self, "_on_exit_pressed")
#	credits.connect("pressed", self, "_on_credits_pressed")
func	_process(delta):
	if fade_anim.modulate.a>=0:
		fade_anim.modulate.a -=1*delta

func _on_menu_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")

func _on_exit_pressed():
	get_tree().quit() 
