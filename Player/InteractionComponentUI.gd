extends Control
class_name InteractionComponentUI

export var interaction_component_nodepath : NodePath

export var interaction_texture_nodepath : NodePath
export var interaction_text_nodepath : NodePath
export var interaction_default_texture : Texture
export var interaction_default_text : String

var fixed_position : Vector2
var lastInteractable : Node
var isInRange : bool
var a

func _ready():
	# We need to connect ourselves to the interaction components signal
	a = get_node(interaction_component_nodepath).connect("on_interactable_changed", self, "interactable_target_changed", [], CONNECT_DEFERRED)
	isInRange = false;
	# On load we should be hidden
	hide()
	
func _process(_delta : float):
	# Because we're a child of the player we'll always be moving relative to them
	# But when we're set against an item we should stick above it
	# So each frame we'll make sure we're moved to our fixed_position
	set_position(fixed_position)
	if (isInRange):
		fixed_position = lastInteractable.get_global_transform_with_canvas().origin - lastInteractable.get_node("Sprite").texture.get_size() * lastInteractable.get_node("Sprite").transform.get_scale()

func interactable_target_changed(newInteractable : Node) -> void:
	# If the new interactable thing is null it means we've moved out of range
	# Lets hide our UI
	if (newInteractable == null):
		isInRange = false;
		hide()
		return
		
	# Otherwise, we've encountered something new
	isInRange = true;
	lastInteractable = newInteractable;
	# We want to get the icon we should display from it, along with the text
	
	# Start by grabbing our default texture & text
	var interaction_texture := interaction_default_texture
	var interaction_text := interaction_default_text
	
	# Then check whether the interactable has a custom texture
	if (newInteractable.has_method("interaction_get_texture")):
		interaction_texture = newInteractable.interaction_get_texture()
	
	# Or custom text
	if (newInteractable.has_method("interaction_get_text")):
		interaction_text = newInteractable.interaction_get_text()
	
	# We'll update our texture and text
	get_node(interaction_texture_nodepath).texture = interaction_texture
	get_node(interaction_text_nodepath).text = interaction_text
	
	# Record the position we should fix ourselves to
	# This should be just above the interactable item
	fixed_position = newInteractable.get_global_transform_with_canvas().origin - (newInteractable.get_node("Sprite").texture.get_size() * newInteractable.get_node("Sprite").transform.get_scale().x)
	
	# Move to our fixed position
	self.set_position(fixed_position)
	
	# Then ensure we show ourselves
	show()
