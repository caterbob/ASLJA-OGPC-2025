extends CharacterBody2D


var v = 0

func _ready() -> void:
	rotate(randi_range(0,360))

func _physics_process(delta: float) -> void:
	velocity.x = -v
	rotate(0.001)
	move_and_slide()
	if position.x <= -200:
		self.queue_free()
