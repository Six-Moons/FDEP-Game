extends Control
var a

func _on_Button_pressed():
	a = get_tree().change_scene("res://Screens/TitleScreen/Titlescreen.tscn")
	pass
