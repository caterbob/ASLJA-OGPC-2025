extends Node2D

@onready var interaction = get_node("balls")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("balls/Interact text").text = "pick up"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_balls_trigger() -> void:
	print("Hooray")
	self.queue_free()
func _on_area_2d_area_entered(area: Area2D) -> void:
	print("hey")
	
