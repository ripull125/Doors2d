extends Area2D

@onready var interact_label = $Interaction_Components/Interact_Label


func _on_body_entered(body):
	#if(key == 0 or papers < 5):
		#interact_label = "Make sure you have a key and five papers!"
	get_tree().change_scene_to_file("res://rooms/REALroom_2.tscn")
