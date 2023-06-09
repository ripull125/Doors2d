extends CharacterBody2D

class_name Player

var speed = 400  # speed in pixels/sec

var rng = RandomNumberGenerator.new()
var papers = 0
var key = 0
var flashlight = 0
@export var canHide = false
var inCloset = false
var cd_over = true
var can_loot = false
var interact_anim
var health = 100
var drawer_open_count = 0
var can_leave = false

var my_random_number = rng.randf_range(0, 100)

var flashlight_text : RichTextLabel
var key_text : RichTextLabel
var paper_text : RichTextLabel

@onready var all_interactions = []
@onready var interact_label = $Interaction_Components/Interact_Label

#func hide_cooldown():
#	var hide_cd = get_tree().create_timer(1.0)
#	hide_cd.timeout.connect()






func _ready():
	update_interactions()
	_giving_item()

func _physics_process(_delta):
	check_dead()
	if(not inCloset):
		var direction = Input.get_vector("left", "right", "up", "down")
		if direction.y > 0:
			$AnimatedSprite2D.play("down")
		elif direction.y < 0:
			$AnimatedSprite2D.play("up")
		elif direction.x > 0:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("side")
		elif direction.x < 0:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("side")
		else:
			$AnimatedSprite2D.play("idle")
		velocity = direction * speed
	
#		print(velocity)
		move_and_slide()
	
# Closet hide and exit 
	if(canHide and Input.is_action_pressed("use") and cd_over):
		inCloset = true
		canHide = false
		print("hidden")
		hide()
		interact_anim.play("open and close")
		cd_over = false
		await get_tree().create_timer(1.0).timeout
		cd_over = true
#		var closet = get_tree().current_scene.get_node("closet")
		
		await get_tree().create_timer(1.0).timeout
		
	elif(inCloset and Input.is_action_pressed("use") and cd_over):
		inCloset = false
		canHide = true
		print("exit")
		show()
		interact_anim.play("open and close")
		cd_over = false
		await get_tree().create_timer(1.0).timeout
		cd_over = true


	if(can_loot and Input.is_action_just_pressed("use")):
		can_loot = false
		interact_anim.play("default")

func check_dead():
	if(health == 0):
		print("dead")
		
		get_tree().change_scene_to_file("res://scenes/youDied.tscn")

# Interaction methods

func _on_interaction_area_area_entered(area):
	all_interactions.insert(0, area)
	if(area.interact_type == "closet"):
		canHide = true
	if(area.interact_type == "drawer"):
		can_loot = true
	if(area.interact_type == "door"):
		can_leave = _check_can_leave()
	interact_anim = all_interactions[0].get_node("AnimatedSprite2D")
	update_interactions()

func _check_can_leave():
	if(key == 1 and papers == 5):
		return true
	else:
		return false

func _on_interaction_area_area_exited(area):
	all_interactions.erase(area)
	if(area.interact_type == "closet"):
		canHide = false
	if(area.interact_type == "drawer"):
		can_loot = false
	if(area.interact_type == "door"):
		can_leave = false
	update_interactions() 
	
func update_interactions():
	if all_interactions:
		interact_label.text = all_interactions[0].interact_label
	else:
		interact_label.text = ""

# monster stuff

func _giving_item():
	if(can_loot):
		if(my_random_number<7):
			flashlight = 1
		if(my_random_number < 101):
			papers += 1
		drawer_open_count += 1
		if(drawer_open_count == 5):
			key += 1

func _on_rush_area_entered(area):
	if(!inCloset):
		health = 0





func _on_eyesMonster_area_entered(area):
		get_tree().change_scene_to_file("res://scenes/youDied.tscn")


func _on_door_body_entered(body):
	get_tree().change_scene_to_file("res://rooms/chase.tscn")


func _on_body_entered(body):
	get_tree().change_scene_to_file("res://rooms/chase.tscn")
