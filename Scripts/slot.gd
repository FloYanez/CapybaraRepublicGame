tool
class_name Slot
extends TextureRect

export(Texture) var empty_texture
export(Texture) var full_texture

var Item = preload("res://Escena/Item.tscn")

export var empty = true setget set_empty
var _item setget set_item_icon

func set_empty(value):
	empty = value
	texture = empty_texture if empty else full_texture
	
func set_item(item):
	self._item = item
	
func set_item_icon(value):
	_item = value
	var i = Item.instance()
	i.texture = load("res://assets/inventory/waterdrop.png")
	add_child(i)
	set_empty(false)
