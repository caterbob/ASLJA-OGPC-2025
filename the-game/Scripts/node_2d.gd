extends Node2D

var Slot = preload("res://Scenes/inventory_slot.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(10):
		var newInvSlot = Slot.instantiate()
		newInvSlot.position = Vector2(0 + i*50,20)
		add_child(newInvSlot)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
