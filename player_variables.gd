extends Node

var hats = ["Vaquero", "Marinero", "Pirata", "DDD"]
var shirts = ["Vaquero", "Marinero", "Pirata", "DDD"]
var accesories = ["Vaquero", "Marinero", "Pirata", "DDD"]
var hasHat
var hasShirt
var hasAcc
var owned
var ss = 0
var rng = RandomNumberGenerator.new()

func takeScreenshot():
	var img = get_viewport().get_texture().get_data()
	# Flip on the Y axis.
	# You can also set "V Flip" to true if not on the root Viewport.
	img.flip_y()
	
	rng.randomize()
	var randNum = int(round(rng.randf_range(0.0, 20.0 + ss)))
	img.save_png("res://Sprites/ignore/Screenshots/screenshot" + str(randNum) + "_" + str(ss) + ".png")
	ss += 1
	pass
