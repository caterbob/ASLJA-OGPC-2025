extends CanvasLayer
signal swap
var active = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func activate():
	self.visible = true
	active = true
	$AnimationPlayer.play("Transition")




func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if active:
		emit_signal("swap")
		active = false
