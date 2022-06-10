extends Node2D

onready var tenant_container = $Tenant
onready var fondo = $TextureRect
onready var apply_button = $ApplyButton
export(Resource) var tenant

var heart_count

func _ready():
	fondo.texture = tenant.apartment
	tenant_container.get_child(0).tenant = tenant
	Gamecontroller.tenants_apartments.append(self)
	apply_button.connect("pressed", tenant, "on_apply")
	
	heart_count = 8

#Pruebas de los likes
func update_count():
	$heart.update_deplete(heart_count)
func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_action_just_pressed("minus") and just_pressed:
		heart_count -=1
	if Input.is_action_just_pressed("add") and just_pressed:
		heart_count +=1

