extends MarginContainer
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var play = $PanelContainer/VBoxContainer/Play
onready var exit = $PanelContainer/VBoxContainer/Exit
onready var credits = $PanelContainer/VBoxContainer/Credits
# Called when the node enters the scene tree for the first time.
func _ready():
	play.connect("pressed", self, "_on_play_pressed")
	exit.connect("pressed", self, "_on_exit_pressed")
	credits.connect("pressed", self, "_on_credits_pressed")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_play_pressed():
	get_tree().change_scene("res://Escena/Intro.tscn")
	Gamecontroller.money = 5000
	
func _on_exit_pressed():
	get_tree().quit() 

func _on_credits_pressed():
	get_tree().change_scene("res://Escena/Credits.tscn")
#	get_tree().change_scene("res://Escena/gameover.tscn")
