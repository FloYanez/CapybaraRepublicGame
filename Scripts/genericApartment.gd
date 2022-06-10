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
	apply_button.connect("pressed", self, "on_apply")

func on_apply():
	if Gamecontroller._current_action != null:
		print("acción y tenant:", Gamecontroller._current_action, tenant.name)
		print("likes antes de la acción:", tenant.current_likes)
		tenant.current_likes += tenant.likes[Gamecontroller._current_action]
		print("likes después de la acción:", tenant.current_likes)

