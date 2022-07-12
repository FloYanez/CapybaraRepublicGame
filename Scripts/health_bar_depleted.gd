extends Control
onready var health_bar = $hearts
var heart_count
var max_health
func _ready():
	max_health = heart_count
	update_count(1)
	
func update_count(value):
	heart_count = value
	health_bar.update_deplete(heart_count)
	


