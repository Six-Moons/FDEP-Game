extends Button

export (String) var scene_to_load


func _on_Menu_Button_mouse_entered():
	$ColorRect.hide()
	$ColorRect2.show()
	pass # Replace with function body.


func _on_Menu_Button_mouse_exited():
	$ColorRect.show()
	$ColorRect2.hide()
	pass # Replace with function body.
