extends StaticBody2D

onready var rootNode = get_parent().get_parent()
var rng = RandomNumberGenerator.new()
var random = 0
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
	print(random)
	if (!rootNode.hasShirt):
		rootNode.hasShirt = true
		rng.randomize()
		random = rng.randi_range(0, 3)
		get_shirt(rootNode.shirts[random])
		rootNode.get_node("CanvasLayer/Inventario").showShirt()
	
	elif (!rootNode.hasHat):
		rootNode.hasHat = true
		rng.randomize()
		random = rng.randi_range(0, 3)
		get_hat(rootNode.hats[random])
		rootNode.get_node("CanvasLayer/Inventario").showHat()
	else:
		rootNode.hasAcc = true
		rng.randomize()
		random = rng.randi_range(0, 3)
		get_accesory(rootNode.accesories[random])
		rootNode.get_node("CanvasLayer/Inventario").showAcc()
	set_used()

	# Remove from interaction layer
	# This will cause it to leave the interaction components overlap, which will hide our UI
	# Collision_layer XOR 8 will give all current layers EXCEPT the layer with the bitwsie value 8
	# If you don't know binary, just hover over the layer in the inspector
	# In my case it shows "interactable Bit 2, value 4" <- the value is what we need
	collision_layer = collision_layer ^ 4
	
func get_shirt(shirtName):
	rootNode.owned.append(shirtName + "Camisa" + ".png")
	print(shirtName + "Camisa" + ".png")
	
func get_hat(hatName):
	rootNode.owned.append(hatName + "Sombrero" + ".png")
	print(hatName + "Sombrero" + ".png")

func get_accesory(accName):
	rootNode.owned.append(accName + "Accesorio" + ".png")
	print(accName + "Accesorio" + ".png")

func set_used() -> void:
	is_open = true
	get_node("Sprite").set_texture(usedSprite)
