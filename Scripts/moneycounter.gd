extends Control

onready var sprite = $Sprite
onready var anim_player = $Sprite/AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")
# Called when the node enters the scene tree for the first time.
#func _ready():
#	coin_spin()
##	coin_idle()

func _ready():
	Gamecontroller.moneycounter=self
	
func coin_spin():
	anim_player.play("spin")
	yield(get_tree().create_timer(1), "timeout")
	anim_player.play("RESET")
	
func coin_idle(): #si quiero que este idle que no haga nada
	anim_player.play("RESET")
