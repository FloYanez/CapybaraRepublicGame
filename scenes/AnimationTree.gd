extends AnimationTree


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")
# Called when the node enters the scene tree for the first time.
func _ready():
	anim_tree = true # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
