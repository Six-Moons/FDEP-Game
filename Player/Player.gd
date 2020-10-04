extends KinematicBody2D
class_name Player

const SPEED = 100
const ACCELERATION = 10
const FRICTION = 10

var velocity = Vector2.ZERO
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _physics_process(_delta):
	var input_vector = Vector2.ZERO
	# Get player input ewe
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# Normalize input vector so that diagonal movement isn't faster, pythagoras and shit (╯°□°)╯
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		# Set blend position of each node of the animation tree 
		# to be equal to the input vector to play the correct animation OwO
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Walk/blend_position", input_vector)
		
		# Animation set up to prioritize walk left/right over up/down when walking diagonally UwU
		animationState.travel("Walk")
		velocity = velocity.move_toward(input_vector * SPEED, ACCELERATION)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	
	# Apply movement and collisions with this godlike godot function that fixes issues
	# with weird edges and makes you _slide_  **GASPS**  └(>o< )┘	
	velocity = move_and_slide(velocity)
	position.x = clamp( position.x, 0, 1152) 
	position.y = clamp( position.y, 0, 1264)
