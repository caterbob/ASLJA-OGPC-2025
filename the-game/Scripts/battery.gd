extends Sprite2D

var batteryLevel = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$batteryText.position = Vector2(10,-10)
	$batteryText.scale = Vector2(0.75,0.75)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	var direction2 := Input.get_axis("ui_up", "ui_down")
	if abs(direction) > 0 or abs(direction2) > 0:
		deplete_battery(.025)
	if Input.is_key_pressed(KEY_I):
		deplete_battery(1)

func deplete_battery(amount) -> void:
	if batteryLevel > 0:
		batteryLevel -= amount
		$batteryText.text = "Power: " + str(round(batteryLevel))
		$batteryLevel.frame = int(28 - batteryLevel/(100/28))
