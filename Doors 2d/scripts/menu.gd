extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$moving/AnimationPlayer.play("movingplayer")
	$moving/AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://rooms/room1.tscn")
	


func _on_options_pressed():
		get_tree().change_scene_to_file("res://scenes/controls.tscn")


func _on_quit_pressed():
	get_tree().quit()
