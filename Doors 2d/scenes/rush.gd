extends Area2D
var rng = RandomNumberGenerator.new()
var kill = false
var can_kill =true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var my_random_number = rng.randf_range(-20000000.0, 20000000.0)
	if(my_random_number >0 and my_random_number < 100000 and can_kill):
		can_kill = false
		await get_tree().create_timer(5.0).timeout
		kill = true
		
	if(kill):
		$AnimationPlayer.play("kill")
		kill = false
		can_kill = true
