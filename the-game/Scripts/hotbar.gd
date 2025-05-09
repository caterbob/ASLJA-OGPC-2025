extends Node2D
var slots = []
var selected = 1
var Slot = preload("res://Scenes/inventory_slot.tscn")
var type = "gear"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(5):
		var newInvSlot = Slot.instantiate()
		newInvSlot.position = Vector2(72 + i*48,38)
		add_child(newInvSlot)
		slots.append(newInvSlot)


	slots[selected].scale = Vector2(1.2,1.2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

		


	if Input.is_action_just_pressed("drop"):
		drop()
	if Input.is_action_just_pressed("scroll_up"):
		if selected > 0:
			selected -= 1
		else:
			selected = slots.size()-1
		for i in slots:
			i.scale = Vector2(1,1)
		slots[selected].scale = Vector2(1.2,1.2)
		pass
	if Input.is_action_just_pressed("scroll_down"):
		if selected < slots.size()-1:
			selected += 1
		else:
			selected = 0
		for i in slots:
			i.scale = Vector2(1,1)
		slots[selected].scale = Vector2(1.2,1.2)
		pass
	
func add(item) -> bool:


	if slots[selected].full == false:
		slots[selected].add_item(item)
		slots[selected].full = true
		return true
	else:
		for slot in slots:
			if slot.full == false:
				slot.add_item(item)
				slot.full = true
				return true
	return false
			
	
func drop() -> void:
	if slots[selected].full:
		slots[selected].remove_item()
		slots[selected].full = false
