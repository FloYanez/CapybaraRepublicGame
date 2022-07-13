extends Node2D

onready var fuego_anim = $AnimationPlayer
onready var fuego_sprite = $Sprite
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
#	Gamecontroller.fuegito = self
	fuego_anim.play("fire")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
