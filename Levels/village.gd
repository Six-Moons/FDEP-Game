extends Node2D

signal game_started
signal game_stopped

#var betty = preload("res://Sprites/betty.png")
var dante0 = preload("res://Sprites/dante_0.png")
var dante1 = preload("res://Sprites/dante_1.png")
var rng = RandomNumberGenerator.new()
var pathChild
var posPathChild
var game_state = "Starting"
var changingScene = false
var ss = 0

func addPathListeners():
	posPathChild = 0
	var childCount = $Node2D/Path2D.get_child_count()
	rng.randomize()
	while posPathChild < childCount:
		pathChild = $Node2D/Path2D.get_child(posPathChild)
		var randNum = int(round(rng.randf_range(0.0, 2.0)))
		if randNum == 1:
			pathChild.get_node("Enemy/Sprite").set_texture(dante0)
		elif randNum == 2:
			pathChild.get_node("Enemy/Sprite").set_texture(dante1)
		
		posPathChild += 1
	pass

func _ready():
	addPathListeners()
	game_state = "Started"
	$AudioStreamPlayer.play()
	reset()
	pass

func reset():
	PlayerVariables.hasHat = false
	PlayerVariables.hasAcc = false
	PlayerVariables.hasShirt = false
	PlayerVariables.owned = []
	
func _physics_process(_delta):
	if Input.is_key_pressed(KEY_SPACE):
		PlayerVariables.takeScreenshot()
	if game_state == "Started":
		game_state = "Playing"
		emit_signal("game_started")
	elif game_state == "Lost":
		if Input.is_action_pressed("ui_accept") and !changingScene:
			changingScene = true
			SceneChanger.change_scene("res://Levels/village.tscn")
		pass

func _on_Enemy_grabbed_player():
	print("ewe")
	game_state = "Lost"
	emit_signal("game_stopped")
	pass # Replace with function body.


func _on_Inventario_full():
	emit_signal("game_stopped")
	$AudioStreamPlayer.stop()
	SceneChanger.change_scene("res://WinScreen/WinScreen.tscn")
	#get_tree().change_scene("res://WinScreen/WinScreen.tscn")
	
#DEBUG PURPOSES function to test winScreen without playing through the game xd
func _input(_event):
	if (Input.is_action_just_pressed("ui_page_down")):
		PlayerVariables.owned.append("DDDCamisa.png")
		PlayerVariables.owned.append("MarineroSombrero.png")
		PlayerVariables.owned.append("MarineroAccesorio.png")
		SceneChanger.change_scene("res://WinScreen/WinScreen.tscn")
