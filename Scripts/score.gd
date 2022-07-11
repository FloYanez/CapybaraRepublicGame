extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	self.text =str(Gamecontroller.money)
