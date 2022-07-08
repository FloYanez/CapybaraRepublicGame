extends Control

onready var sprite = $Sprite
onready var anim_player = $Sprite/AnimationPlayer
# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass 

func coin_shine():
	anim_player.play("shine")
