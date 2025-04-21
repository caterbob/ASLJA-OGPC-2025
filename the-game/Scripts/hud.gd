extends CanvasLayer


# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	# self.position.x = Player.position.x
	self.transform.origin = Vector2(20,20)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
