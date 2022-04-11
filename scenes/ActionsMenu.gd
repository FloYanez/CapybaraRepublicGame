extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false # Replace with function body.

func _input(event):
	if event.is_action_pressed("pause") and not event.is_echo():
		get_tree().paused = true
		visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
