extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	self.scale = Vector2(1/get_parent().scale.x,1/get_parent().scale.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_field_body_entered(body: Node2D) -> void:
	
	self.visible = true


func _on_field_body_exited(body: Node2D) -> void:
	self.visible = false
	
