extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_Area2D_area_entered(area):
	if area.is_in_group('portal'):
		get_tree().change_scene_to_file("res://rooms/REALroom_2.tscn")
