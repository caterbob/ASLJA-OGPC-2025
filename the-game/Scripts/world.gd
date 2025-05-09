extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.set_process(false)
	self.visible = false
	self.position = Vector2(9999999999999,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		switchToOutside()
		
		
func switchToOutside():
		self.position = Vector2(9999999999999999,0)
		$AudioStreamPlayer.stop()
		var outside = get_node("/root/Outside")
		outside.set_process(true)
		outside.visible = true
		for i in outside.get_children():
			i.set_process(true)

		for i in self.get_children():
			i.set_process(false)

		self.visible = false
		self.set_process(false)
		outside.position = Vector2(0,0)
