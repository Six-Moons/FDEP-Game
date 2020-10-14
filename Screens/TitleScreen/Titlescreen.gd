extends Control

var changingScene = false
onready var tween_values = [1, 1.2]
var a

func _input(_event):
	if Input.is_key_pressed(KEY_SPACE):
		PlayerVariables.takeScreenshot()

func _on_PlayButton_pressed():
	a = get_tree().change_scene($Menu/CenterRow/Buttons/PlayButton.scene_to_load)
	pass # Replace with function body.

func _on_CreditsButton_pressed():
	a = get_tree().change_scene($Menu/CenterRow/Buttons/CreditsButton.scene_to_load)	
	pass # Replace with function body.
