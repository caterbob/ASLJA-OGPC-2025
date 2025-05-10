extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	$AudioStreamPlayer.stop()
	var world = get_node("/root/World")
	world.set_process(true)
	world.visible = true
	world.position = Vector2(0,0)
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
