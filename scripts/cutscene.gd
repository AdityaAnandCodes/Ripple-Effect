extends Control


func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/WORLD2.tscn")
