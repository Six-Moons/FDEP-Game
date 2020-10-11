extends HBoxContainer

var max_val = 100
var current_progress = 0

func initialize(maximum):
	max_val = maximum
	$TextureProgress.max_value = maximum

func _on_interface_progress_changed(progress, isProgressing):
	if isProgressing:
		if !$Tween.is_active():
			animate_value(current_progress, progress)
			current_progress = progress
	else:
		animate_value(current_progress, progress)
		current_progress = progress
	
func animate_value(start, end):
	$Tween.interpolate_property($TextureProgress, "value", start, end, 0.6, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()
