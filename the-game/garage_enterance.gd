extends Node2D
signal enter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Interaction field/Interact text".text = "Enter"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interaction_field_trigger() -> void:
	$AnimatedSprite2D.play()
	get_node("/root/Player").set_process(false)
	



	


func _on_animated_sprite_2d_animation_looped() -> void:
	$AnimatedSprite2D.stop()
	emit_signal("enter")
	get_node("/root/Player").set_process(true)
