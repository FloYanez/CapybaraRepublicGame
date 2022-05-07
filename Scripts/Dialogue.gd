extends Control

var dialog
var dialog_index = 0
var finished = false # que al final del dialogo cambi esta variable a true, y al final tiene que haber una funcion que se active es verdadera y pase a la siguiente escena
var end_intro = false

onready var transition_timer = get_node("Sprite/transition_timer")
onready var sprite = $Sprite
onready var anim_player = $Sprite/AnimationPlayer

export var dialogPath = ""
export (float) var textSpeed = 0.03


func _ready():
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialog not found")
	nextdialog()
	
func _process(_delta):
	$nextdialogue.visible = finished
	if Input.is_action_just_pressed("ui_accept"):#un click o enter y se salta
		if finished:
			nextdialog()
		else:
			$Text.visible_characters = len($Text.text)#lo deja correr
			
func getDialog() -> Array:
	var f = File.new()
	assert(f.file_exists(dialogPath), "Error en el path")
	
	f.open(dialogPath, File.READ)#leemos el .json
	var json = f.get_as_text()
	var output = parse_json(json)#lo transforma en array y lo verifica
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []

func nextdialog() -> void:
	if dialog_index >= len(dialog): # si terminamos de leer la lista
#		queue_free() #este termina la animación pero quizá es mejor que pase a otra escena
		anim_player.play("wink")
		yield(get_tree().create_timer(2), "timeout")
		get_tree().change_scene("res://Escena/Building.tscn")
		return
	finished=false
	$Name.bbcode_text = dialog[dialog_index]["Name"]#esto define donde van los extraibles del json
	$Text.bbcode_text = dialog[dialog_index]["Text"]
	
	$Text.visible_characters = 0 #no se como funciona esto pero solo es la animacion
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		$Timer.start()
		yield($Timer, "timeout")
		
	finished = true
	dialog_index += 1
	return
