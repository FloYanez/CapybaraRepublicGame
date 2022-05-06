tool
extends TextureRect

export(Texture) var empty_texture
export(Texture) var full_texture
export var empty = true setget set_empty

func set_empty(value):
	empty = value
	texture = empty_texture if empty else full_texture
