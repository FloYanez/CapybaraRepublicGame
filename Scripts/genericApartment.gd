extends Node2D

onready var tenant_container = $Tenant
onready var fondo = $TextureRect
export(Resource) var tenant


func _ready():
	fondo.texture = tenant.apartment
	tenant_container.get_child(0).tenant = tenant
