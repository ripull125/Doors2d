class_name Interactable extends Area2D

@export var interact_label = "Press [e] to hide in the closet"
@export var interact_type = "none"
@export var interact_value = ""


 


func _on_area_entered(area):
	if (area.canHide && Input.is_action_just_pressed("use")):
		$AnimatedSprite2D.play("open and close")
	else:
		$AnimatedSprite2D.play("idle")
