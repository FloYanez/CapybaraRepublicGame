extends MarginContainer

onready var grid_container = $Inventory/Items
onready var legend_label = $Inventory/Legend/LegendLabel

var _legend setget set_legend 
var _legends = []

func _ready():
	visible = false 
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
		
func set_legend(value):
	_legend = value
	legend_label.text = str(_legend)
	legend_label.visible = true
	
func set_legend_null():
	legend_label.visible = false
	
	
	

	


	
	
