extends MarginContainer



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var play = $PanelContainer/VBoxContainer/Play
onready var exit = $PanelContainer/VBoxContainer/Exit
# Called when the node enters the scene tree for the first time.
func _ready():
	play.connect("pressed", self, "_on_play_pressed")
	exit.connect("pressed", self, "_on_exit_pressed")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_play_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")
	
func _on_exit_pressed():
	get_tree().quit() 

