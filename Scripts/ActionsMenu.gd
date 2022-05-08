extends MarginContainer

onready var grid_container = $GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false # Replace with function body.
	var file = File.new()
	file.open("res://Data/inventory.json", File.READ)
	var items = JSON.parse(file.get_as_text()).result
	file.close()
	
	for slotIndex in items.keys():
		var slot: Slot = grid_container.get_child(int(slotIndex))
		slot.set_item(items[slotIndex].item)

func _input(event):
	if event.is_action_pressed("pause") and not event.is_echo():
		get_tree().paused = true
		visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
