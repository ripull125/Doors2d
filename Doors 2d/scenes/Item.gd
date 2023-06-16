extends Node2D

var item_name
var item_quantity

func _ready():
	var rand_val = randi() % 2
	if rand_val == 0:
		item_name = "Key"
	else:
		item_name = "Flashlight"
	
	$TextureRect.texture = load("res://sprites/" + item_name + ".png")

func set_item(nm, qt):
	item_name = nm
	item_quantity = qt
	$TextureRect.texture = load("res://sprites/" + item_name + ".png")
		
func add_item_quantity(amount_to_add):
	item_quantity += amount_to_add
	$Label.text = String(item_quantity)
	
func decrease_item_quantity(amount_to_remove):
	item_quantity -= amount_to_remove
	$Label.text = String(item_quantity)
