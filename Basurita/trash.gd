extends StaticBody2D

var usedSprite = preload("res://Sprites/trash_can_used.png")
var is_open := false
func interaction_can_interact(interactionComponentParent : Node) -> bool:
	return interactionComponentParent is Player

# Not implemented - we'll use the default texture instead
#func interaction_get_texture() -> Texture:
#	pass

func interaction_get_text() -> String:
	return "Buscar"

func interaction_interact(interactionComponentParent : Node) -> void:
	if is_open:
		return

	is_open = true
	get_node("Sprite").set_texture(usedSprite)

	# Remove from interaction layer
	# This will cause it to leave the interaction components overlap, which will hide our UI
	# Collision_layer XOR 8 will give all current layers EXCEPT the layer with the bitwsie value 8
	# If you don't know binary, just hover over the layer in the inspector
	# In my case it shows "interactable Bit 2, value 4" <- the value is what we need
	collision_layer = collision_layer ^ 4
