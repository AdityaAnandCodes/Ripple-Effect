extends Node

var first_time = false

var rwh1_assesible = false 
var rwh2_assesible = false
var rwh3_assesible = false
var rwh4_assesible = false
var rwh5_assesible = false
var rwh6_assesible = false
var rwh7_assesible = false
var rwh8_assesible = false
var rwh9_assesible = false

var home1_agreed = false
var home2_agreed = false
var home3_agreed = false
var home4_agreed = false
var home5_agreed = false
var home6_agreed = false
var home7_agreed = false
var home8_agreed = false
var home9_agreed = false

var rwh1_installed = false
var rwh2_installed = false
var rwh3_installed = false
var rwh4_installed = false
var rwh5_installed = false
var rwh6_installed = false
var rwh7_installed = false
var rwh8_installed = false
var rwh9_installed = false


var Water

func _ready():
	Water = 100
	
func _process(delta):
	if Water <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")



