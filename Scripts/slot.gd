tool
class_name Slot
extends TextureRect

export(Texture) var empty_texture
export(Texture) var full_texture

var Item = preload("res://Escena/Item.tscn")
onready var inventory = get_node("../../..")
export var empty = true setget set_empty
var _item setget set_item_icon
var _legend setget set_legend

func _ready():
	connect("gui_input", self, "_on_gui_input")
	
func set_empty(value):
	empty = value
	texture = empty_texture if empty else full_texture
	
func set_item(item):
	self._item = item
	
func set_legend(value):
	_legend = str(value)
	
func set_item_icon(value):
	_item = value
	var i = Item.instance()
	i.texture = load("res://assets/Sprites/inventory/waterdrop.png")
	add_child(i)
	set_empty(false)
	
func _on_gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		print("hizo click")
		
	elif event is InputEventMouseMotion and not empty:
		inventory.set_legend(_legend)
	
	elif event is InputEventMouseMotion and empty:
		inventory.set_legend_null()
