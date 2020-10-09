extends CanvasLayer
var changingScene = false
export(AudioStream) var winSound
onready var audioPlayer = $AudioStreamPlayer
onready var disfraz = $Disfraz
onready var playera = load("res://Sprites/" + PlayerVariables.owned[0])
onready var sombrero = load("res://Sprites/" + PlayerVariables.owned[1])
onready var accesorio = load("res://Sprites/" + PlayerVariables.owned[2])
onready var viewportWidth = get_viewport().get_visible_rect().size.x
onready var viewportHeight = get_viewport().get_visible_rect().size.y

onready var bgScale = viewportWidth / $Background.texture.get_size().x

func _ready():
	setUp()

func _input(event):
	if (Input.is_action_pressed("ui_accept") and !changingScene):
		changingScene = true
		SceneChanger.change_scene("res://Levels/village.tscn")

func setUp():

	#Center the sprites, required only if the sprite's Offset>Centered checkbox is set
	$Background.set_position(Vector2(viewportWidth/2, viewportHeight/2))
	$Disfraz/Sombrero.set_position(Vector2(viewportWidth/2 + 70 * bgScale, viewportHeight/2 - 3 * bgScale))
	$Disfraz/Playera.set_position(Vector2(viewportWidth/2 + 70 * bgScale, viewportHeight/2 - 3 * bgScale))
	$Disfraz/Accesorio.set_position(Vector2(viewportWidth/2 + 75 * bgScale, viewportHeight/2 - 3 * bgScale))

	# Set same scale value horizontally/vertically to maintain aspect ratio
	# If however you don't want to maintain aspect ratio, simply set different
	# scale along x and y
	$Background.set_scale(Vector2(bgScale, bgScale))
	$Disfraz/Sombrero.set_scale(Vector2(3.1 * bgScale, 3.1 * bgScale))
	$Disfraz/Playera.set_scale(Vector2(3.1 * bgScale, 3.1 * bgScale))
	$Disfraz/Accesorio.set_scale(Vector2(3.1 * bgScale, 3.1 * bgScale))
	#Play win sound
	audioPlayer.stream = winSound
	audioPlayer.play()
	#Set the needed costume
	mostrar_disfraz()

func mostrar_disfraz():
	disfraz.get_node("Playera").set_texture(playera)
	disfraz.get_node("Sombrero").set_texture(sombrero)
	disfraz.get_node("Accesorio").set_texture(accesorio)


func _on_Timer_timeout():
	$Label.show()
	pass # Replace with function body.
