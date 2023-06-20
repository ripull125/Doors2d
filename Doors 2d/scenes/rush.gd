extends Area2D
var rng = RandomNumberGenerator.new()
var kill = false
var can_kill =true


# Called when the node enters the scene tree for the first time.
func _ready():
	$flicker.visible = false
	can_kill = true
	show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var my_random_number = rng.randf_range(-20000000.0, 20000000.0)
	if(my_random_number >0 and my_random_number < 20000 and can_kill):
		can_kill = false
		$flicker.visible = true
		await get_tree().create_timer(1.0).timeout
		$flicker.visible = false
		await get_tree().create_timer(3.0).timeout
		kill = true
		
	if(kill):
		kill = false
		$AnimationPlayer.play("kill")
		await get_tree().create_timer(2.0).timeout
		hide()
