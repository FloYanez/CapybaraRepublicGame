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
	


