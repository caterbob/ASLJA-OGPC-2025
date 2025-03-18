extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_pile_of_parts_body_entered(body: Node2D) -> void:
	if body == get_parent():
		self.visible = true
	
func _on_pile_of_parts_body_exited(body: Node2D) -> void:
	if body == get_parent():
		self.visible = false
