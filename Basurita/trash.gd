extends StaticBody2D

onready var rootNode = get_parent().get_parent()
var rng = RandomNumberGenerator.new()
var random = 0
var usedSprite = preload("res://Assets/Sprites/trash_can_used.png")
var unusedSprite = preload("res://Assets/Sprites/trash_can.png")
var is_open := false
func interaction_can_interact(interactionComponentParent : Node) -> bool:
	return interactionComponentParent is Player

func _ready():
	rng.randomize()

func interaction_get_text() -> String:
	return "Buscar"

func interaction_interact(_interactionComponentParent : Node) -> void:
	if is_open:
		return
#	print(random)
	if (!PlayerVariables.hasShirt):
		PlayerVariables.hasShirt = true
		rng.randomize()
		random = rng.randi_range(0, 3)
		get_shirt(PlayerVariables.shirts[random])
		rootNode.get_node("InventoryHUD/Inventario").showShirt()
	
	elif (!PlayerVariables.hasHat):
		PlayerVariables.hasHat = true
		rng.randomize()
		random = rng.randi_range(0, 3)
		get_hat(PlayerVariables.hats[random])
		rootNode.get_node("InventoryHUD/Inventario").showHat()
	else:
		PlayerVariables.hasAcc = true
		rng.randomize()
		random = rng.randi_range(0, 3)
		get_accesory(PlayerVariables.accesories[random])
		rootNode.get_node("InventoryHUD/Inventario").showAcc()
	set_used()

	# Remove from interaction layer
	# This will cause it to leave the interaction components overlap, which will hide our UI
	# Collision_layer XOR 8 will give all current layers EXCEPT the layer with the bitwsie value 8
	# If you don't know binary, just hover over the layer in the inspector
	# In my case it shows "interactable Bit 2, value 4" <- the value is what we need
	collision_layer = collision_layer ^ 4

func get_shirt(shirtName):
	PlayerVariables.owned.append(shirtName + "Camisa" + ".png")
#	print(shirtName + "Camisa" + ".png")
	
func get_hat(hatName):
	PlayerVariables.owned.append(hatName + "Sombrero" + ".png")
#	print(hatName + "Sombrero" + ".png")

func get_accesory(accName):
	PlayerVariables.owned.append(accName + "Accesorio" + ".png")
#	print(accName + "Accesorio" + ".png")

func set_used() -> void:
	is_open = true
	get_node("Sprite").set_texture(usedSprite)
	
func set_unused() -> void:
	is_open = false
	get_node("Sprite").set_texture(unusedSprite)
