extends InteractableItem
class_name ConsumableItem

export var interaction_texture : Texture = preload("res://Sprites/interactionhand.png")

func interaction_get_texture() -> Texture:
	return interaction_texture

func interaction_get_text() -> String:
	return "Drink"
