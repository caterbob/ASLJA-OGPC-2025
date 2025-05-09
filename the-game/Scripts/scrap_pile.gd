extends Node2D
@onready var gear = preload("res://Scenes/item.tscn")
signal trigger()
@onready var rng = RandomNumberGenerator.new()
@onready var totalGears = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()              # seed from OS/time
	$"balls/Interact text".text = "Dig"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_balls_trigger():
	if totalGears > 0:
		totalGears -= 1
		var new_object = gear.instantiate()  # NEW in Godot 4
		add_child(new_object)
		new_object.position = Vector2(
			generate_random_coord(25, 55), generate_random_coord(25, 55)
		)  # still the same
	
func generate_random_coord(innerLimit, outerLimit):
	var isLeft = rng.randi_range(0, 1)
	if isLeft == 0:
		return -rng.randi_range(innerLimit, outerLimit)
	else:
		return rng.randi_range(innerLimit, outerLimit)
	
