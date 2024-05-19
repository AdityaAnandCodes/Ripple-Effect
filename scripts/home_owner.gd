extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@export var plumber : CharacterBody2D
var talk  : bool = false


func _ready():
	anim.play("idleFront")
	$Label.visible = false

func _process(delta):
	pass

func talking():
	pass
	
func _on_mayor_skip_talk_now():
	pass
	


func _on_mayor_home_1():
	if not Game.home1_agreed:
		if Game.first_time == false:
			Dialogic.start("FirstTime")
			Game.first_time = true
			Game.home1_agreed = true
		else:
			Dialogic.start("OtherTimes")
			Game.home1_agreed = true
	


func _on_area_2d_body_entered(body):
	if body.name == "mayor" and Game.home1_agreed == false :
		$Label.visible = true
	


func _on_area_2d_body_exited(body):
	if body.name == "mayor":
		$Label.visible = false
