extends CanvasLayer

func _ready():
	$Background.hide()
	pass

func reset():
	$Background.hide()
	var i = 1;
	while i <= 4:
		get_child(i).get_child(0).hide()
		get_child(i).get_child(1).hide()
		get_child(i).get_child(2).hide()
		i += 1
	pass

func mostrar_disfraz(disfraz):
	$Background.show()
	get_node(disfraz).get_child(0).show()
	get_node(disfraz).get_child(1).show()
	get_node(disfraz).get_child(2).show()
	pass
