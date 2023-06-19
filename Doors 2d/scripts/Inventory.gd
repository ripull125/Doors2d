extends Node2D

const SlotClass = preload("res://Slot.gd")
const ItemClass = preload("res://Item.gd")
const NUM_INVENTORY_SLOTS = 20

var inventory = ()
# Called when the node enters the scene tree for the first time.
func add_item(item_name, item_quantity):
		for item in inventory:
			if inventory[item][0] == item_name:
				var stack_size = int(JsonData.item_data[item_name])

