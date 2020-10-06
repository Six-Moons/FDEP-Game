extends Control

signal full

export(NodePath) var hat
export(NodePath) var shirt
export(NodePath) var acc

var cant = 0

#func hideInventory():
#	$LabelPaTontas.hide()
#	$TextureRect.hide()
#	get_node(hat).hide()
#	get_node(shirt).hide()
#	get_node(acc).hide()

func reset():
	cant = 0;
	$LabelPaTontas.show()
	$TextureRect.show()
	get_node(hat).hide()
	get_node(shirt).hide()
	get_node(acc).hide()

func checkIfFull():
	if cant >= 3:
		emit_signal("full")

func showHat():
	cant += 1
	checkIfFull()
	get_node(hat).show()

func showShirt():
	cant += 1
	checkIfFull()
	get_node(shirt).show()
	
func showAcc():
	cant += 1
	checkIfFull()
	get_node(acc).show()
