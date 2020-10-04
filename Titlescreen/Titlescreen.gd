extends CanvasLayer

onready var tween_values = [1, 1.2]
onready var initialScale = $StartButton.scale

func _ready():
#	_start_tween()
	pass

func _start_tween():
	$StartButton.scale = initialScale
	$StartButton/Tween.interpolate_property($StartButton, 
								'scale', 
								$StartButton.scale * tween_values[0], 
								$StartButton.scale * tween_values[1], 
								1, 
								Tween.TRANS_QUAD,
								Tween.EASE_IN_OUT)  
	$StartButton/Tween.start()

func _process(delta):
	if Input.is_key_pressed(KEY_ENTER) or Input.is_mouse_button_pressed(BUTTON_LEFT):
		get_tree().change_scene("res://village.tscn")

func _on_Tween_tween_completed(object, key):
	tween_values.invert()
	_start_tween()
	pass # Replace with function body.
