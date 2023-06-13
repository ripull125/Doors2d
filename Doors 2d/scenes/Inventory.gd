@tool

extends Node2D

const SlotClass = preload("res://scenes/Slot.gd")
onready var inventory_slots = $GridContainer
var holding

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
