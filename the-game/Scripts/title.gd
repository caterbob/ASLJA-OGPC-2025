extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	var world = get_node("/root/World")
	world.set_process(true)
	world.visible = true
	world.isFactory = true
	var player = get_node("/root/Player")
	player.set_process(true)
	player.position = Vector2(220, 93)
	player.visible = true
	player.activate_hud()
	self.visible = false
	self.set_process(false)
	var camera = get_node("/root/Player/Camera2D")
	camera.set_zoom(Vector2(3, 3))
