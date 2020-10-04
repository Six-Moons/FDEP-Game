extends Control

export(NodePath) var hat
export(NodePath) var shirt
export(NodePath) var acc

func showHat():
	get_node(hat).show()

func showShirt():
	get_node(shirt).show()
	
func showAcc():
	get_node(acc).show()
