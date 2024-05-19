extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@export var plumber : CharacterBody2D
var talk  : bool = false


func _ready():
	anim.play("idleFront")

func _process(delta):
	pass

func talking():
	pass
	
func _on_mayor_skip_talk_now():
	pass
	


func _on_mayor_home_6():
	if not Game.home6_agreed:
		if Game.first_time == false:
			Dialogic.start("FirstTime")
			Game.first_time = true
			Game.home6_agreed = true
		else:
			Dialogic.start("OtherTimes")
			Game.home6_agreed = true
	
