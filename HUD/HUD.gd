extends CanvasLayer

func restart():
	$BlackScreen.hide()
	$TextEdit.text= ""

func _ready():
	restart()
#	get_tree().call_group("enemy", "_on_Enemy_grabbed_player")
#	$Timer.connect("timeout", self, "_on_Timer_timeout")

func _on_Enemy_grabbed_player():
	$TextEdit.text= "Perdiste unu"
	$BlackScreen.show()
	pass # Replace with function body.
