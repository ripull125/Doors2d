extends CharacterBody2D

var speed = 400  # speed in pixels/sec

var coins = 0
var key = 0
var flashlight = 0
var canHide = false
var inCloset = false

@onready var all_interactions = []
@onready var interact_label = $Interaction_Components/Interact_Label

#func hide_cooldown():
#	var hide_cd = SceneTree.create_timer(1.0).timeout

func _ready():
	update_interactions()

func _physics_process(_delta):

	if(not inCloset):
		var direction = Input.get_vector("left", "right", "up", "down")
		if direction.y > 0:
			$AnimatedSprite2D.play("down")
		else:
			$AnimatedSprite2D.play("idle")
		velocity = direction * speed
	
#	print(velocity)

	move_and_slide()
	if(canHide and Input.is_action_pressed("use")):
		inCloset = true
		canHide = false
		print("hidden")
		hide()
#		player.visible = !player.visible
		
#		hide_cooldown()
		
	elif(inCloset and Input.is_action_pressed("use")):
		inCloset = false
		canHide = true
		print("exit")
		show()
#		player.visible
#
#		hide_cooldown()



# Interaction methods

func _on_interaction_area_area_entered(area):
	all_interactions.insert(0, area)
	canHide = true
	update_interactions()


func _on_interaction_area_area_exited(area):
	all_interactions.erase(area)
	canHide = false
	update_interactions() 
	
func update_interactions():
	if all_interactions:
		interact_label.text = all_interactions[0].interact_label
	else:
		interact_label.text = ""
