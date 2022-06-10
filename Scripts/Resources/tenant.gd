extends Resource
class_name Tenant


export(Texture) var front
export(Texture) var side
export(Texture) var apartment

export(Dictionary) var likes
export(String) var name

func on_apply():
	if Gamecontroller._current_action != null:
		print(Gamecontroller._current_action, name)
