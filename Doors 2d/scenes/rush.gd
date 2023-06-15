extends Area2D
var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var my_random_number = rng.randf_range(-20000000.0, 20000000.0)
	if(my_random_number >0 and my_random_number < 10000000):
		$AnimationPlayer.play("kill")
