extends CharacterBody2D


const SPEED = 300.0

var motion : Vector2 = Vector2()
var direction : Vector2 = Vector2()

# Get the gravity from the project settings to be synced with RigidBody nodes.
func check_input():
	motion = Vector2()
	var moving = true
	if Input.is_action_just_pressed("forward"):
		motion.y -= 1
		direction = Vector2(0, -1)
#		$AnimatedSprite2D.play("forward")
	elif Input.is_action_just_pressed("backward"):
		motion.y += 1
		direction = Vector2(0, 1)
#	else:
#		motion.y = 0
#		moving = false or moving
		
	elif Input.is_action_just_pressed("left"):
		motion.x -= 1
		direction = Vector2(-1, 0)
	elif Input.is_action_just_pressed("right"):
		motion.x += 1
		direction = Vector2(1, 0)
#	else:
#		motion.x = 0
#		moving = false or moving
	motion = motion.normalized()
	motion = move_and_slide(motion*200)
func _physics_process(delta):
	# movement
	check_input()
	$AnimatedSprite2D.play("forward")
	#if moving == false:
		#$AnimatedSprite2D.play("default")


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)

#	move_and_slide()
