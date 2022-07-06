extends Control
onready var health_bar = $hearts
var heart_count
var max_health
func _ready():
	max_health = heart_count
	update_count(6)
	
func update_count(value):
	heart_count = value
	health_bar.update_deplete(heart_count)
	
#Funcion a cambiar para que funcione con el panel, ademas que que cuanto suma dependa de los likes y displikes
#func _physics_process(delta):
#	if Input.is_action_just_pressed("minus") and heart_count > 0: #and just_pressed:
#		heart_count -=1
#		update_count()
#	if Input.is_action_just_pressed("add") and heart_count < max_health: #and just_pressed:
#		heart_count +=1
#		update_count()
