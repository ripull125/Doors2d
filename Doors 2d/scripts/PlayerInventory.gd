extends Node

signal active_item_updated

const SlotClass = preload("res://scripts/Slot1.gd")
const ItemClass = preload("res://scenes/Item.gd")
const NUM_HOTBAR_SLOTS = 8

var active_item_slot = 0

var hotbar = {
	0: ["Key"],  #--> slot_index: [item_name]
	1: ["Screech"]
}

# TODO: First try to add to hotbar

# TODO: Make compatible with hotbar as well
func update_slot_visual(slot_index, item_name, new_quantity):
	var slot = get_tree().root.get_node("/root/World/UserInterface/Inventory/GridContainer/Slot" + str(slot_index + 1))
	if slot.item != null:
		slot.item.set_item(item_name, new_quantity)
	else:
		slot.initialize_item(item_name, new_quantity)

func remove_item(slot: SlotClass):
	match slot.SlotType:
		SlotClass.SlotType.HOTBAR:
			hotbar.erase(slot.slot_index)

func add_item_to_empty_slot(item: ItemClass, slot: SlotClass):
	match slot.SlotType:
		SlotClass.SlotType.HOTBAR:
			hotbar[slot.slot_index] = [item.item_name, item.item_quantity]

###
### Hotbar Related Functions
func active_item_scroll_up() -> void:
	active_item_slot = (active_item_slot + 1) % NUM_HOTBAR_SLOTS
	emit_signal("active_item_updated")

func active_item_scroll_down() -> void:
	if active_item_slot == 0:
		active_item_slot = NUM_HOTBAR_SLOTS - 1
	else:
		active_item_slot -= 1
	emit_signal("active_item_updated")
