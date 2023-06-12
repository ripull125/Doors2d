extends Area2D

var entered = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_body_entered(body: PhysicsBody2D):
	entered = true

func _process(delta):
	if entered == true:
		if input.is_action_just_pressed("use")
		
		
