extends Control

onready var sprite = $Sprite
onready var anim_player = $Sprite/AnimationPlayer
# Called when the node enters the scene tree for the first time.
#func _ready():
#	coin_spin()
##	coin_idle()
	
func coin_spin():
	anim_player.play("spin")
	
func coin_idle(): #si quiero que este idle que no haga nada
	anim_player.play("RESET")
