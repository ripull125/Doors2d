extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if randi()%2 == 0:
		$TextureRect.texture = load("res://flashlight.png")
	else:
		$TextureRect.texture = load("res://bandage.png")
