extends CharacterBody2D


var SPEED = 50.0

@onready var animation = $AnimatedSprite2D

@onready var battery = get_node("/root/Player/HUD/Battery")
	
func _physics_process(delta: float) -> void:
	pass
	# Add the gravity.
	
func _ready() -> void:
	self.position = Vector2(190, 90)
	
	get_tree().get_root().add_child(self)
	self.owner = null
	self.position = Vector2(0,0)
	
	$HUD.visible = false
	$HUD.set_process(false)
	self.set_process(false)
	self.visible = false

	
	


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
		$AnimatedSprite2D/shadow.position.y = 13
	elif velocity.x < 0:
		animation.play("walkLeft")
		$AnimatedSprite2D/shadow.position.y = 13
	elif velocity.y > 0:
		animation.play("walkDown")
		$AnimatedSprite2D/shadow.position.y = 13
	elif velocity.y < 0:
		animation.play("walkUp")
		$AnimatedSprite2D/shadow.position.y = 12
	else:
		animation.stop()
		
	
	move_and_slide()

func activate_hud():
	$HUD.visible = true
	$HUD.set_process(true)

func lightOff():
	$PointLight2D.energy = 0
func lightOn():
	$PointLight2D.energy = 1
