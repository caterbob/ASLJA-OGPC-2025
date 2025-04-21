extends Sprite2D

var batteryLevel = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$batteryText.position = Vector2(10,-10)
	$batteryText.scale = Vector2(0.75,0.75)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_I):
		deplete_battery()

func deplete_battery() -> void:
	if batteryLevel > 0:
		batteryLevel -= 1
		$batteryText.text = "Power: " + str(batteryLevel)
		$batteryLevel.frame = int(28 - batteryLevel/(100/28))
