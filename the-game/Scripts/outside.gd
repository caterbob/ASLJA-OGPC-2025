extends Node2D

@onready var snow = preload("res://Scenes/snowball.tscn")
var gust = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	self.set_process(false)
	self.position = Vector2(9999999999999,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in range(3):
		var ball = snow.instantiate()
		add_child(ball)
		ball.z_index = 5
		var size = randf_range(0.25,1.0)
		ball.scale = Vector2(size, size)
		ball.v = 150/size
		ball.position = Vector2(300,randi_range(-100,520))
	for i in range(3):
		var ball2 = snow.instantiate()
		add_child(ball2)
		ball2.z_index = 5
		var size2 = randf_range(0.25,1.0)
		ball2.scale = Vector2(size2, size2)
		ball2.v = 200/size2
		ball2.position = Vector2(300, gust + randi_range(-20,20))
		
		
func switchToInside():
	self.position = Vector2(9999999999999999,0)
	get_node("/root/Player").visible = true
	var garage = get_node("/root/World")
	garage.set_process(true)
	garage.visible = true
	get_node("/root/Player").lightOn()
	for i in garage.get_children():
		i.set_process(true)
	
	for i in self.get_children():
		i.set_process(false)
	garage.isFactory = true
	self.visible = false
	self.set_process(false)
	garage.position = Vector2(0,0)
	get_node("/root/Player").position = get_node("/root/World").get_node("ExitSign").position


func _on_garage_enterance_enter() -> void:
	$Transition.activate()
	


func _on_transition_swap() -> void:
	switchToInside()
	$Transition/AnimationPlayer.play_backwards("Transition")


func _on_snow_switch_timeout() -> void:

	gust = randi_range(0,200)
