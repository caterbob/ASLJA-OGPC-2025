extends Area2D

var player_in_range : bool = false
var interact_text
var player
signal interact_with_pile()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interact_text = get_node("/root/World/Player/interactText")
	player = get_node("/root/World/Player")
	self.body_entered.connect(_on_body_entered)
	self.body_exited.connect(_on_body_exited)
	interact_text.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("interact"):
		print("signal!")
		emit_signal("interact_with_pile")

func _on_body_entered(body: Node2D) -> void:
	if body == player:
		interact_text.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body == player:
		interact_text.visible = false
