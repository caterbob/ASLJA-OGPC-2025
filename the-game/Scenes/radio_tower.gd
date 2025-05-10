extends Node2D
@onready var battery = get_node("/root/Player/HUD/Battery")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Interaction field/Interact text".text = "power"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interaction_field_trigger() -> void:
	if battery.batteryLevel >= 99:
		get_node("/root/WinScreen").visible = true
