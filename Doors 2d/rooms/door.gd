extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body: PhysicalBody2D):
	entered = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene("res://rooms/REALroom_2.tscn")
