extends CharacterBody2D


var SPEED = 50.0

@onready var animation = $AnimatedSprite2D

var battery
	
func _physics_process(delta: float) -> void:
	pass
	# Add the gravity.
	
func _ready() -> void:
	
	get_tree().get_root().add_child(self)
	self.owner = null
	
	
	battery = get_node("/root/World/Battery")


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
func _process(delta: float) -> void:
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
		
	#animation
	if velocity.x > 0:
		animation.play("walkRight")
	elif velocity.x < 0:
		animation.play("walkLeft")
	elif velocity.y > 0:
		animation.play("walkDown")
	elif velocity.y < 0:
		animation.play("walkUp")
	else:
		animation.stop()
	
	move_and_slide()
