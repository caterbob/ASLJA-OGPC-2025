extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	self.set_process(false)
	self.position = Vector2(9999999999999,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		switchToInside()
		
		
func switchToInside():
	self.position = Vector2(9999999999999999,0)
	$AudioStreamPlayer.stop()
	var garage = get_node("/root/World")
	garage.set_process(true)
	garage.visible = true
	for i in garage.get_children():
		i.set_process(true)

	for i in self.get_children():
		i.set_process(false)

	self.visible = false
	self.set_process(false)
	garage.position = Vector2(0,0)


func _on_garage_enterance_enter() -> void:
	switchToInside()
