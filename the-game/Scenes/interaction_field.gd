extends Node2D
var entered = false
signal trigger()
signal not_trigger()
signal power_up()
signal got_entered()
signal got_exited()

@onready var animation = get_parent().get_node("Crank Animation")
@onready var hand_crank = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Interact text".text = "Break"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and entered:
		emit_signal("trigger")

func _on_field_body_entered(body: Node2D) -> void:
	emit_signal("got_entered")
	entered = true


func _on_field_body_exited(body: Node2D) -> void:
	emit_signal("got_exited")
	entered = false
