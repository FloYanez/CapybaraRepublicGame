extends Node2D

onready var tenant_container = $Tenant
onready var fondo = $TextureRect
onready var apply_button = $ApplyButton
onready var health_bar = $Hearts
onready var unoccupied_panel = $Unoccupied
onready var unoccupied = false
onready var current_effect = null
onready var effects = {	"agua": preload("res://Escena/anim_sunk.tscn"),
						"raton": preload("res://Escena/anim_ratón.tscn"),
						"luz": preload("res://Escena/anim_light.tscn"),
						"musica": preload("res://Escena/anim_music.tscn"),
						"aire": preload("res://Escena/anim_AC.tscn"),
						"alarma": preload("res://Escena/anim_fuegito.tscn"),
						"olor": preload("res://Escena/anim_odor.tscn")}
export(Resource) var tenant

onready var building = get_node("../..")

var heart_count

func _ready():
	fondo.texture = tenant.apartment
	tenant_container.get_child(0).tenant = tenant
	Gamecontroller.tenants_apartments.append(self)
	apply_button.connect("pressed", self, "on_apply")

func on_apply():
	if Gamecontroller._current_action != null:
		var new_count = tenant.current_likes + tenant.likes[Gamecontroller._current_action]
		if current_effect != null:
			current_effect.queue_free()
		current_effect = effects[Gamecontroller._current_action].instance()
		add_child(current_effect,0)
		if new_count <= 0:
			new_count = 0
			unoccupied_panel.visible = true
			unoccupied = true  #aca
			tenant_container.visible = false
			building.check_all_gone()
			current_effect.queue_free()
		elif new_count > 6:
			new_count = 6
		tenant.current_likes = new_count
		health_bar.update_count(new_count)
		Gamecontroller.use_action()

func apply_action_button():
	if !unoccupied:
		apply_button.visible = true

