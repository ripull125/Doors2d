extends CharacterBody2D

@export var move_speed : float = 100

func _physics_process(_delta):
	var input_direction = Vector2(Input.get_action_strength("right")-Input.get_action_strength("left"), Input.get_action_strength("backward")-Input.get_action_strength("forward"))
	var velocity = input_direction * move_speed
	move_and_slide()
	
	print(input_direction)
