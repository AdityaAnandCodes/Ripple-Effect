extends StaticBody2D

@onready var DamagedPipe = $Pipelines2
@onready var Pipe = $Pipelines
@onready var Leakage = $AnimatedSprite2D
@onready var FixedExplosion = $CPUParticles2D
@onready var ClickArea = $Area2D
@onready var WaterDamageTime = $WaterDamage
@onready var audio = $AudioStreamPlayer2D
var clickPosition
var mouse_in = false


var minimap_icon = "alert"

# Called when the node enters the scene tree for the first time.
func _ready():
	DamagedPipe.visible = false
	Leakage.visible = false
	
func _process(delta):
	pass

func startsLeaking():
	audio.play()
	WaterDamageTime.start()
	self.add_to_group("minimap_objects")
	Pipe.visible = false
	Leakage.visible = true
	DamagedPipe.visible = true
	Leakage.play("default")


func _physics_process(delta):
	if mouse_in and Input.is_action_pressed("Click"):
		audio.stop()
		WaterDamageTime.stop()
		FixedExplosion.emitting = true
		self.remove_from_group("minimap_objects")
		Leakage.stop()
		Leakage.visible = false
		Pipe.visible = true
		DamagedPipe.visible = false
		
		



func _on_area_2d_mouse_entered():
	mouse_in = true
	
func _on_area_2d_mouse_exited():
	mouse_in = false


func _on_timer_timeout():
	startsLeaking()
	WaterDamageTime.start()
	


func _on_water_damage_timeout():
	Game.Water -= 5
	
