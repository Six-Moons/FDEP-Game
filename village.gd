extends Node2D

#var betty = preload("res://Sprites/betty.png")
var dante0 = preload("res://Sprites/dante_0.png")
var dante1 = preload("res://Sprites/dante_1.png")
var rng = RandomNumberGenerator.new()
var pathChild
var posPathChild

func _ready():
	posPathChild = 0
	pathChild = $Node2D/Path2D.get_child(posPathChild)
	while pathChild != null:
		rng.randomize()
		var randNum = int(round(rng.randf_range(0.0, 2.0)))
		
		if randNum == 1:
			pathChild.get_node("Enemy/Sprite").set_texture(dante0)
		elif randNum == 2:
			pathChild.get_node("Enemy/Sprite").set_texture(dante1)
		
		posPathChild += 1
		pathChild = $Node2D/Path2D.get_child(posPathChild)
		

