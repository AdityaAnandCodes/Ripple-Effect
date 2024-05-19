extends StaticBody2D
var minimap_icon = "alert"

var interactable
@onready var anim = $AnimatedSprite2D
@onready var label = $Label
@onready var WaterDamage = $WaterDamage
@onready var audio = $AudioStreamPlayer2D

func _ready():
	anim.play("tapClosed")
	
func _process(delta):
	if interactable and Input.is_action_just_pressed("Interact"):
		anim.play("tapFix")
		self.remove_from_group("minimap_objects")
		WaterDamage.stop()
		label.visible = false
		audio.stop()
		

func _on_timer_timeout():
	anim.play("tapOpen")
	WaterDamage.start()
	audio.play()
	self.add_to_group("minimap_objects")
	label = $Label


func _on_area_2d_body_entered(body):
	if body.name == "mayor":
		if label : 
			label.visible = true
		interactable = true
		


func _on_area_2d_body_exited(body):
	if body.name == "mayor":
		if label : 
			label.visible = false
		interactable = false


func _on_water_damage_timeout():
	Game.Water = Game.Water - 1
