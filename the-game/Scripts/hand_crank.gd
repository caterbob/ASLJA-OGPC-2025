extends Node2D

@onready var animation = $"Crank Animation"
@onready var battery = get_node("/root/Player/HUD/Battery")
@onready var inventory = get_node("/root/Player/HUD/hotbar")
var condition
var entered

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("broken")
	condition = "broken"
	entered = false
	$"Crank Interaction/Interact text".text = "Crank"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(inventory.total_items)
	if condition == "broken":
		if inventory.total_items >= 4:
			$"Crank Interaction/Interact text".text = "Fix"
		else:
			$"Crank Interaction/Interact text".text = "Gears?"
	elif condition == "fixed":
		$"Crank Interaction/Interact text".text = "Crank"
		
	if Input.is_action_just_pressed("interact") and entered and condition == "broken":
		var gears = 0
		var itemSlots = []
		for i in inventory.slots:
			if i.full:
				if i.contained_item.type == "gear":
					gears += 1
					itemSlots.append(i)
					if gears == 4:
						condition = "fixed"
						for slot in itemSlots:
							slot.expend()
						break
		
	# if hand crank is fixed, allow cranking and battery charging
	if Input.is_action_pressed("interact") and entered and condition == "fixed":
		animation.play("cranking")
		battery.charge_battery(0.1)
	else:
		animation.stop()

func _on_crank_interaction_got_entered() -> void:
	entered = true


func _on_crank_interaction_got_exited() -> void:
	entered = false
