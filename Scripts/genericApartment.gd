extends Node2D

onready var tenant_container = $Tenant
onready var fondo = $TextureRect
onready var apply_button = $ApplyButton
onready var health_bar = $Hearts
export(Resource) var tenant

var heart_count

func _ready():
	fondo.texture = tenant.apartment
	tenant_container.get_child(0).tenant = tenant
	Gamecontroller.tenants_apartments.append(self)
	apply_button.connect("pressed", self, "on_apply")

func on_apply():
	if Gamecontroller._current_action != null:
		var new_count = tenant.current_likes + tenant.likes[Gamecontroller._current_action]
		if new_count < 0:
			new_count = 0
		elif new_count > 6:
			new_count = 6
		tenant.current_likes = new_count
		health_bar.update_count(new_count)
		Gamecontroller.use_action()

