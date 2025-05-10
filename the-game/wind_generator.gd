extends Node2D
var carrying = false
@onready var battery = get_node("/root/Player/HUD/Battery")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Interaction field/Interact text".text = "pick up"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var wind = get_node("/root/Outside").gust
	print(wind)
	print(position.y)
	if carrying:
		position.x = get_node("/root/Player").position.x
		position.y = get_node("/root/Player").position.y - 32
	if wind - 20 < position.y and position.y < 30 + wind and carrying:
		$AnimatedSprite2D.play("default")
		battery.charge_battery(0.2)
	else:
		$AnimatedSprite2D.stop()


func _on_interaction_field_trigger() -> void:
	carrying = true
