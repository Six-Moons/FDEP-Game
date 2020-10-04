extends CanvasLayer

func _ready():
	$Background.hide()

func mostrar_disfraz(disfraz):
	$Background.show()
	get_node(disfraz).get_child(0).show()
	get_node(disfraz).get_child(1).show()
	get_node(disfraz).get_child(2).show()
	pass
