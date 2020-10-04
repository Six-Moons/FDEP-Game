extends StaticBody2D

signal nearPlayer(trash)

export (int) var radius = 50
onready var player = get_parent().get_parent().get_node("Player")

func _physics_process(_delta):
	var input_vector = (player.global_position - global_position)
	if input_vector.length() > radius:
			emit_signal("trash", self)
