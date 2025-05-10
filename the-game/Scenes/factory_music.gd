extends AudioStreamPlayer
var world

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	world = get_node("/root/World")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.playing == false and world.isFactory:
		self.play()
	elif !world.isFactory:
		self.stop()
