extends StaticBody2D

@onready var interaction = get_node("balls")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("balls/Interact text").text = "scavenge"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
