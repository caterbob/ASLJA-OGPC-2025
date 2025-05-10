extends Sprite2D

var full = false
var contained_item = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		

		
func add_item(item) -> void:
	item.get_parent().remove_child(item)
	item.scale = Vector2(2, 2)
	item.position = Vector2(0,0)
	contained_item = item
	self.add_child(item)
	
	full = true

	pass
func remove_item() -> void:
	var item = contained_item
	#var newInteraction = preload("res://Scenes/interaction_field.tscn")
	#var interactionInstance = newInteraction.instantiate()
	self.remove_child(item)
	get_node("/root/Player").get_parent().add_child(item)
	item.position = get_node("/root/Player").position
	item.scale = Vector2(1, 1)
	item.onGround = true
	#item.addConnection(interactionInstance)
	print("I HATE YOU")
	contained_item = null
	full = false

func expend():
	var trash = contained_item
	self.remove_child(contained_item)
	trash.queue_free()
	full = false
