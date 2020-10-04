extends KinematicBody2D

const SPEED = 40
const ACCELERATION = 10
const FRICTION = 10

export (int) var caughtRadius = 30;
export (int) var detectionRadius = 40;
export (int) var pursueRadius = 50
var state = "Walking" # Walking, Pursuing
export (Vector2) onready var initialPosition = Vector2(256, 128)

var velocity = Vector2.ZERO
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var player = get_parent().get_node("Player")

func _ready():
	global_position = initialPosition

func _physics_process(_delta):
	var input_vector = (player.global_position - global_position)
	var movement_vector = input_vector.normalized()

	if state == "Walking":
		var dir = (initialPosition - global_position)

		if dir == Vector2.ZERO or dir.length() <= 0.5:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
			animationState.travel("Idle")
			global_position = initialPosition
		else:
			velocity = velocity.move_toward(dir.normalized() * SPEED, ACCELERATION)
			animationTree.set("parameters/Idle/blend_position", dir.normalized())
			animationTree.set("parameters/Run/blend_position",  dir.normalized())
			animationState.travel("Run")
		if input_vector.length() < detectionRadius:
			state = "Pursuing"
	elif state == "Pursuing":
		animationTree.set("parameters/Idle/blend_position", movement_vector)
		animationTree.set("parameters/Run/blend_position", movement_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(movement_vector * SPEED, ACCELERATION)
		if input_vector.length() > pursueRadius:
			state = "Walking"
	velocity = move_and_slide(velocity)
