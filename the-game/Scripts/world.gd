extends Node2D
var isFactory

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	isFactory = false
	self.set_process(false)
	self.visible = false
	self.position = Vector2(9999999999999,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		$Transition.activate()
	
		
		
func switchToOutside():
		self.position = Vector2(9999999999999999,0)
		isFactory = false

		var outside = get_node("/root/Outside")
		var player = get_node("/root/Player")
		player.lightOff()
		outside.set_process(true)
		outside.visible = true
		for i in outside.get_children():
			i.set_process(true)

		for i in self.get_children():
			i.set_process(false)
		get_node("/root/Player").position = get_node("/root/Outside").get_node("Garage Enterance").position

		self.visible = false
		self.set_process(false)
		outside.position = Vector2(0,0)
		
		
func _on_transition_swap() -> void:
	switchToOutside()

	$Transition/AnimationPlayer.play_backwards("Transition")
