extends MarginContainer
class_name Minimap

@export var player: Player
@export var zoom = 1.5

@onready var grid = $MarginContainer/Grid
@onready var player_marker = $MarginContainer/Grid/PlayerMarker
@onready var mob_marker = $MarginContainer/Grid/MobMarker
@onready var alert_marker = $MarginContainer/Grid/AlertMarker

@onready var icons = {
	"mob": mob_marker,
	"alert": alert_marker
}

var grid_scale
var markers = {}

func _ready():
	await get_tree().process_frame
	player_marker.position = grid.size / 2
	grid_scale = grid.size / (get_viewport_rect().size * zoom)
	
	update_map_objects()

func _process(delta):
	if !player:
		return

	update_map_objects()

	var player_direction = player.current_dir
	var player_rotation = 0.0
	
	if player_direction == "Right":
		player_rotation = PI / 2
	elif player_direction == "Left":
		player_rotation = -PI / 2
	elif player_direction == "Up":
		player_rotation = 0
	elif player_direction == "Down":
		player_rotation = PI

	player_marker.rotation = player_rotation
	
	for item in markers:
		var obj_pos = (item.position - player.position) * grid_scale + grid.size / 2
		obj_pos = obj_pos.clamp(Vector2.ZERO, grid.size)
		markers[item].position = obj_pos
		if grid.get_rect().has_point(obj_pos + grid.position):
			markers[item].show()
		#else:
			#markers[item].hide()
		if grid.get_rect().has_point(obj_pos + grid.position):
			markers[item].scale = Vector2(1, 1)
		else:
			markers[item].scale = Vector2(0.75, 0.75)

func update_map_objects():
	var current_map_objects = get_tree().get_nodes_in_group("minimap_objects")

	# Identify new items to add
	for item in current_map_objects:
		if item not in markers:
			_add_marker(item)

	# Identify items to remove
	var keys_to_remove = []
	for item in markers.keys():
		if item not in current_map_objects:
			keys_to_remove.append(item)
	
	for item in keys_to_remove:
		_remove_marker(item)

func _add_marker(item):
	if item.minimap_icon in icons:
		var new_marker = icons[item.minimap_icon].duplicate()
		grid.add_child(new_marker)
		new_marker.show()
		markers[item] = new_marker

func _remove_marker(item):
	if item in markers:
		markers[item].queue_free()
		markers.erase(item)
