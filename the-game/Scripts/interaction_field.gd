extends Node2D

var entered = false
signal trigger()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		emit_signal("trigger")





func _on_field_body_entered(body: Node2D) -> void:
	entered = true


func _on_field_body_exited(body: Node2D) -> void:
	entered = false
