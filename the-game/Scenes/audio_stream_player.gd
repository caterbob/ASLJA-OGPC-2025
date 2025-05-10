extends AudioStreamPlayer
var world

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.stop()
	world = get_node("/root/World")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#if world.isFactory:
	#	self.play()
	#	print("factory")
	#else:
	#	self.stop()
	#	print("Not factory")
