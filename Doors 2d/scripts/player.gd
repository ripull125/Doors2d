extends CharacterBody2D

var speed = 400  # speed in pixels/sec



func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction.y > 0:
		$AnimatedSprite2D.play("down")
	else:
		$AnimatedSprite2D.play("idle")
	velocity = direction * speed
	print(velocity)

	move_and_slide()
