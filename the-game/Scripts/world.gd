extends Node2D
var isFactory

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	isFactory = false
	self.set_process(false)
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		self.switchToOutside()


func switchToOutside() -> void:
	isFactory = false
	var outside = get_node("/root/Outside")
	outside.set_process(true)
	outside.visible = true
	for i in outside.get_children():
		i.set_process(true)
	for i in self.get_children():
		i.set_process(false)
	self.visible = false
	self.set_process(false)
