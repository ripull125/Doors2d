extends CharacterBody2D


const SPEED = 300.0
var motion = Vector2()

# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	# movement
	
	if Input.is_action_just_pressed("forward"):
		motion.y = 20
	elif Input.is_action_just_pressed("backward"):
		motion.y = -20
	else:
		motion.y = 0
	if Input.is_action_just_pressed("left"):
		motion.x = -20
	elif Input.is_action_just_pressed("right"):
		motion.x = 20
	else:
		motion.x = 0


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)

#	move_and_slide()
