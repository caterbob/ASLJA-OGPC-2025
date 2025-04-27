extends Node2D
@onready var gear = preload("res://Scenes/item.tscn")
signal trigger()
@onready var rng = RandomNumberGenerator.new()
@onready var totalGears = 3
@onready var battery = get_node("/root/Player/HUD/Battery")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()              # seed from OS/time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and $Interaction.entered:
		if battery.batteryLevel > 50:
			print("BREAK!")
		else:
			print("NO BREAK!")

func _on_interaction_trigger() -> void:
	print("YA")
