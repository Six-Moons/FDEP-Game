extends HBoxContainer

var max_val = 100
var current_progress = 0

func initialize(maximum):
	max_val = maximum
	$TextureProgress.max_value = maximum

func _on_interface_progress_changed(progress):
	animate_value(current_progress, progress)
	current_progress = progress
	
func animate_value(start, end):
	$Tween.interpolate_property($TextureProgress, "value", start, end, 1, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()
	

func _on_Tween_tween_step(object, key, elapsed, value):
	print (value)
	pass # Replace with function body.
