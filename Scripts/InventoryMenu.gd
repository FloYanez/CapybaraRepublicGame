extends MarginContainer

onready var grid_container = $Inventory/Items
onready var legend_label = $Inventory/Legend/LegendLabel
onready var close_button = $Inventory/Titulo/close
var _legend setget set_legend 
var _legends = []
var _effects = []

func _ready():
	visible = false 
	close_button.connect("pressed", self, "on_close_pressed")
	var file = File.new()
	file.open("res://Data/inventory.json", File.READ)
	var items = JSON.parse(file.get_as_text()).result
	file.close()
	
	for slotIndex in items.keys():
		var slot: Slot = grid_container.get_child(int(slotIndex))
		slot.set_item(items[slotIndex].item)
		slot.set_legend(items[slotIndex].legend)
		slot.set_item_icon(items[slotIndex].icon)
		_legends.append(items[slotIndex].legend)
		_effects.append(items[slotIndex].effect)
		
func set_legend(value):
	_legend = value
	legend_label.text = str(_legend)
	legend_label.visible = true
	
func set_legend_null():
	legend_label.visible = false

func on_close_pressed():
	self.visible = false
	
	

	


	
	
