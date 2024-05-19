extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
var follow_mayor: bool = true
@export var mayor: CharacterBody2D
@export var speed: float = 100.0
var closest_node = null
var minimap_icon = "mob"

var front_ray 
var back_ray 
var right_ray 
var left_ray 


func _ready():
	anim.play("idleFront")
	
	front_ray = $Front
	back_ray = $Back
	right_ray = $Right
	left_ray = $Left
	
func _physics_process(delta):
	if follow_mayor:
		follow(mayor)

func _process(delta):
	animation_alignment()
	if closest_node:
		follow(closest_node)
		check_raycast_collisions()
	if follow_mayor:
		follow(mayor)

func follow(target):
	var difference = target.position - position
	if follow_mayor and abs(difference.x) < 40 or abs(difference.y) < 40:
		velocity = Vector2.ZERO
	else:
		if abs(difference.x) > abs(difference.y):
			velocity.x = sign(difference.x) * speed
			velocity.y = 0
		else:
			velocity.x = 0
			velocity.y = sign(difference.y) * speed
	move_and_slide()

func animation_alignment():
	if velocity.y < 0 and velocity.x == 0:
		anim.play("walkBack")
	elif velocity.y > 0 and velocity.x == 0:
		anim.play("walkFront")
	elif velocity.x > 0 and velocity.y == 0 :
		anim.play("walkRight")
	elif velocity.x < 0 and velocity.y == 0 :
		anim.play("walkLeft")
	else:
		if anim.animation == "walkBack":
			anim.play("idleBack")
		elif anim.animation == "walkFront":
			anim.play("idleFront")
		elif anim.animation == "walkRight":
			anim.play("idleRight")
		elif anim.animation == "walkLeft":
			anim.play("idleLeft")

func check_raycast_collisions():
	if front_ray.is_colliding():
		anim.play("fixFront")
		var collider = front_ray.get_collider()
		if collider and collider.is_in_group("rain_water_harvesting"):
			emit_signal_to_harvesting_node(collider)

	if back_ray.is_colliding():
		anim.play("fixBack")
		var collider = back_ray.get_collider()
		if collider and collider.is_in_group("rain_water_harvesting"):
			emit_signal_to_harvesting_node(collider)
			

	if right_ray.is_colliding():
		anim.play("fixRight")
		var collider = right_ray.get_collider()
		if collider and collider.is_in_group("rain_water_harvesting"):
			emit_signal_to_harvesting_node(collider)

	if left_ray.is_colliding():
		anim.play("fixLeft")
		var collider = left_ray.get_collider()
		if collider and collider.is_in_group("rain_water_harvesting"):
			emit_signal_to_harvesting_node(collider)

func emit_signal_to_harvesting_node(node):
	if node.has_method("_on_rain_water_harvesting_installed"):
		node._on_rain_water_harvesting_installed()
		follow_mayor = true
		closest_node = null
		
		


func _on_teaguy_agree():
	follow_mayor = false
	var closest_distance = 9999999999
	var current_closest: Node2D = null

	for node in get_tree().get_nodes_in_group("rain_water_harvesting"):
		var distance = node.global_position.distance_to(position)
		if distance < closest_distance:
			closest_distance = distance
			current_closest = node
	
	if closest_distance:
		closest_node = current_closest
	


func _on_teaguy_2_agree():
	follow_mayor = false
	var closest_distance = 9999999999
	var current_closest: Node2D = null

	for node in get_tree().get_nodes_in_group("rain_water_harvesting"):
		var distance = node.global_position.distance_to(position)
		if distance < closest_distance:
			closest_distance = distance
			current_closest = node
	
	if closest_distance:
		closest_node = current_closest
	
