extends Control

onready var skip = $skipbutton

func _ready():
	skip.connect("pressed", self, "_on_skip_pressed")
func _on_skip_pressed():
	get_tree().change_scene("res://Escena/Building.tscn")
