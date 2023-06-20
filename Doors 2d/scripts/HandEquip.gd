@tool
extends Sprite2D

class_name HandEquip

@export var equipped_item : EquipableItem :
	set(next_equipped):
		equipped_item = next_equipped
		self.texture = next_equipped.texture
		
@export var sprite_2d : Sprite2D

# Called when the node enters the scene tree for the first time.
func _on_area_2d_body_entered(body):
	if(equipped_item.has_method("interact_with_body")):
		equipped_item.interact_with_body(body)
