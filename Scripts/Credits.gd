extends Control

onready var exit = $TextureButton
func _ready():
	exit.connect("pressed", self, "_on_exit_pressed")

func _on_exit_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")

