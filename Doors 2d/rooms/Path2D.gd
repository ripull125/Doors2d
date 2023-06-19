extends Path2D


extends CharacterBody2D

@export var speed = 1000

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if get_parent().get_progress_ratio() ==1:
		queue_free()
