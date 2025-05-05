extends Node2D

@onready var animation = $"Crank Animation"
@onready var battery = get_node("/root/Player/HUD/Battery")
var condition
var entered

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	condition = "broken"
	entered = false
	$"Crank Interaction/Interact text".text = "Crank"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if condition == "broken":
		$"Crank Interaction/Interact text".text = "Fix"
	elif condition == "fixed":
		$"Crank Interaction/Interact text".text = "Crank"
		
	if Input.is_action_just_pressed("interact") and entered and condition == "broken":
		condition = "fixed"
	# if hand crank is fixed, allow cranking and battery charging
	if Input.is_action_pressed("interact") and entered and condition == "fixed":
		animation.play("cranking")
		battery.charge_battery(0.1)
	else:
		animation.stop()



func _on_crank_interaction_trigger() -> void:
	animation.play("cranking")


func _on_crank_interaction_not_trigger() -> void:
	animation.stop()


func _on_crank_interaction_got_entered() -> void:
	entered = true


func _on_crank_interaction_got_exited() -> void:
	entered = false
