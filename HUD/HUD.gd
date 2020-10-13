extends CanvasLayer

func restart():
	$BlackScreen.hide()
	$TextEdit.hide()

func _ready():
	restart()

func _on_Enemy_grabbed_player():
	$TextEdit.show()
	$BlackScreen.show()
	pass # Replace with function body.
