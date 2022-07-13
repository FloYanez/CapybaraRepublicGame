extends Node2D
onready var anim_player = $AnimationPlayer
onready var sprite = $Sprite


# Called when the node enters the scene tree for the first time.
func _ready():
#	Gamecontroller.raton = self
	anim_player.play("plaga")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
