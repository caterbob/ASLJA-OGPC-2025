extends Sprite2D

var full = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		

		
func add_item() -> void:
	if $item.texture == null:
		$item.set_texture(preload("res://Sprites/icon.svg"))
		full = true
	pass
func remove_item() -> void:
	$item.set_texture(null)
	full = false
