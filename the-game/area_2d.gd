extends Area2D

var player_in_range : bool = false
signal interact_with_pile()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_range and Input.is_key_pressed(KEY_E):
		print("signal!")
		emit_signal("interact_with_pile")


func _on_body_entered(body: Node2D) -> void:
	player_in_range = true
	

func _on_body_exited(body: Node2D) -> void:
	player_in_range = false
