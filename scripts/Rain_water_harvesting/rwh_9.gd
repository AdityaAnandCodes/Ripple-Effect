extends StaticBody2D

@onready var anim = $AnimatedSprite2D
var RWHSI : bool = false
var minimap_icon = "alert"
var interactable

func _ready():
	$Label.visible = false
	$Watertank.visible = false
	anim.play("default")

func _process(delta):
	if Game.home9_agreed and not Game.rwh9_installed:
		self.add_to_group("minimap_objects")
	if Game.rwh9_assesible and Game.home9_agreed and not Game.rwh9_installed and Input.is_action_pressed("Interact"):
		install_rwh()
		Game.rwh9_installed = true
		Game.Water += 15
	if Game.rwh9_installed:
		self.remove_from_group("minimap_objects")
		

func install_rwh():
	self.remove_from_group("minimap_objects")
	$Watertank.visible = true
	anim.play("Done")
	self.remove_from_group("rain_water_harvesting")

func _on_animated_sprite_2d_animation_finished():
	if anim.animation == "Done":
		anim.visible = false


func _on_area_2d_body_entered(body):
	if body.name == "mayor":
		$Label.visible = true
		Game.rwh9_assesible = true


func _on_area_2d_body_exited(body):
	if body.name == "mayor":
		$Label.visible = false
		Game.rwh9_assesible = false
	
