extends StaticBody2D

@onready var anim = $AnimatedSprite2D
var minimap_icon = "alert"
var RWHSI : bool = false
var interactable
@onready var label = $Label

func _ready():
	$Label.visible = false
	$Watertank.visible = false
	anim.play("default")

func _process(delta):
	if Game.home1_agreed and not Game.rwh1_installed:
		self.add_to_group("minimap_objects")
	if Game.rwh1_assesible and Game.home1_agreed and not Game.rwh1_installed and Input.is_action_pressed("Interact"):
		install_rwh()
		Game.rwh1_installed = true
		Game.Water += 15
	if Game.rwh1_installed:
		self.remove_from_group("minimap_objects")
		
		
	

func install_rwh():
	$Watertank.visible = true
	anim.play("Done")
	self.remove_from_group("minimap_objects")

func _on_animated_sprite_2d_animation_finished():
	if anim.animation == "Done":
		anim.visible = false


func _on_area_2d_body_entered(body):
	if body.name == "mayor":
		$Label.visible = true
		Game.rwh1_assesible = true


func _on_area_2d_body_exited(body):
	if body.name == "mayor":
		$Label.visible = false
		Game.rwh1_assesible = false
	
