extends KinematicBody2D

var horizontal_speed = 300
var velocity = Vector2.ZERO
var gravity = 300
var direction = 0 #Mult de velocidad -1 izquierda, 0 nada, 1 derecha


onready var sprite = $Sprite
onready var anim_player = $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")
func _ready():
	anim_tree.active = true
	
func _physics_process(delta): #gravedad
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.y += gravity*delta
	if is_on_floor() and velocity.y > 0: #si va cayendo con velocidad y choca de una
		velocity.y = 0
	
	direction = floor(rand_range(-1, 2)) #saca un entero aleatorio, el floor le saca los decimales
	if direction == 0:# or is_on_wall #si no hay dirección la velocidad en x es 0
		velocity.x = 0
	elif direction == -1: #si mira hacia la izquierda la velocidad se hace negativa
		velocity.x = direction*horizontal_speed
	elif direction == 1: #si mira a la derecha
		velocity.x= direction*horizontal_speed
