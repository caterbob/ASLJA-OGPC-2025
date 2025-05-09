extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.set_zoom(Vector2(1, 1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
