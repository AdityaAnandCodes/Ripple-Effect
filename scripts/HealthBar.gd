extends ProgressBar


@onready var timer = $Timer
@onready var damagebar = $DamageBar

var Water = 0 : set= _set_Water

func _set_Water(new_Water):
	var prev_Water = Water 
	Water = min(max_value,new_Water)
	value = Water
	if Water <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	if Water < prev_Water:
		timer.start()
	else:
		damagebar.value = Water


func _init_Water(_Water):
	Water = _Water
	max_value = Water
	value = Water
	damagebar.max_value = Water
	damagebar.value = Water

func _on_timer_timeout():
	damagebar.value= Water
