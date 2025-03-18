extends CharacterBody2D


var SPEED = 50.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	



	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	var direction2 := Input.get_axis("ui_up", "ui_down")
	if direction and direction2:
		velocity.x = direction * SPEED / sqrt(2)
		velocity.y = direction2 * SPEED / sqrt(2)

	elif direction2:
		velocity.y = direction2 * SPEED
		velocity.x = move_toward(velocity.x, 0, SPEED)
	elif direction:
		velocity.x = direction * SPEED
		velocity.y = move_toward(velocity.y, 0, SPEED)
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_interact_with_pile() -> void:
	SPEED += 100
