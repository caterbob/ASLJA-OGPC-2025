extends Node2D
@onready var inventory = get_node("/root/Player/HUD/hotbar")
@onready var interaction = get_node("balls")
var onGround = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("balls/Interact text").text = "pick up"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_balls_trigger() -> void:
	if onGround:
		print("Hooray")
		if inventory.add(self):
			print("balls")
			onGround = false
