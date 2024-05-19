extends CharacterBody2D
class_name Player

signal home1
signal home2
signal home3
signal home4
signal home5
signal home6
signal home7
signal home8
signal home9


var interactable1 = false
var interactable2 = false
var interactable3 = false
var interactable4 = false
var interactable5 = false
var interactable6 = false
var interactable7 = false
var interactable8 = false
var interactable9 = false


var have_talked1 = false
var have_talked2 = false
var have_talked3 = false
var have_talked4 = false
var have_talked5 = false
var have_talked6 = false
var have_talked7 = false
var have_talked8 = false
var have_talked9 = false



@onready var anim = $AnimatedSprite2D
@export var speed : float = 350.0
var minimap_icon = "arrow"
var current_dir="none"





func _ready():
	anim.play("idlefront")
	

func _physics_process(delta):
	player_movement(delta)
	IO()

func player_movement(delta):
	if Input.is_action_pressed("Right"):
		current_dir="Right"
		play_anim(1)
		velocity.x = speed 
		velocity.y = 0
	elif Input.is_action_pressed("Left"):
		current_dir="Left"
		play_anim(1)
		velocity.x= -speed 
		velocity.y=0
	elif Input.is_action_pressed("Up"):
		current_dir="Up"
		play_anim(1)
		velocity.x= 0
		velocity.y=-speed 
	elif Input.is_action_pressed("Down"):
		current_dir="Down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed 
	else:
		play_anim(0)
		velocity.x= 0
		velocity.y=0
	move_and_slide()

func play_anim(movement):
	if current_dir == "Right":
		if movement==1:
			anim.play("walkRight")
		elif movement==0:
			anim.play("idleRight")
	if current_dir == "Left":
		if movement==1:
			anim.play("walkLeft")
		elif movement==0:
			anim.play("idleLeft")
	if current_dir == "Up":
		if movement==1:
			anim.play("walkBack")
		elif movement==0:
			anim.play("idleBack")
	if current_dir == "Down":
		if movement==1:
			anim.play("walkFront")
		elif movement==0:
			anim.play("idleFront")

func IO():
	if interactable1 and Input.is_action_pressed("Talk"):
		emit_signal("home1")
	if interactable2 and Input.is_action_pressed("Talk"):
		emit_signal("home2")
	if interactable3 and Input.is_action_pressed("Talk"):
		emit_signal("home3")
	if interactable4 and Input.is_action_pressed("Talk"):
		emit_signal("home4")
	if interactable5 and Input.is_action_pressed("Talk"):
		emit_signal("home5")
	if interactable6 and Input.is_action_pressed("Talk"):
		emit_signal("home6")
	if interactable7 and Input.is_action_pressed("Talk"):
		emit_signal("home7")
	if interactable8 and Input.is_action_pressed("Talk"):
		emit_signal("home8")
	if interactable9 and Input.is_action_pressed("Talk"):
		emit_signal("home9")

func _on_area_2d_body_entered(body):
	if body.name == "home_owner_1":
		interactable1 = true
	if body.name == "home_owner_2":
		interactable2 = true
	if body.name == "home_owner_3":
		interactable3 = true
	if body.name == "home_owner_4":
		interactable4 = true
	if body.name == "home_owner_5":
		interactable5 = true
	if body.name == "home_owner_6":
		interactable6 = true
	if body.name == "home_owner_7":
		interactable7 = true
	if body.name == "home_owner_8":
		interactable8 = true
	if body.name == "home_owner_9":
		interactable9 = true


func _on_area_2d_body_exited(body):
	if body.name == "home_owner_1":
		interactable1 = false
	if body.name == "home_owner_2":
		interactable2 = false
	if body.name == "home_owner_3":
		interactable3 = false
	if body.name == "home_owner_4":
		interactable4 = false
	if body.name == "home_owner_5":
		interactable5 = false
	if body.name == "home_owner_6":
		interactable6 = false
	if body.name == "home_owner_7":
		interactable7 = false
	if body.name == "home_owner_8":
		interactable8 = false
	if body.name == "home_owner_9":
		interactable9 = false
	
