extends PathFollow2D

const SPEED = 70

func _process(delta):
	set_offset(get_offset() + SPEED * delta)
	pass # Replace with function body.
