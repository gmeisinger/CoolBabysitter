extends Node2D

signal end_reached()

export var climb_speed : float = 10.0
export var side = false

onready var points = $path.get_curve().get_baked_points()
onready var host = get_parent()

func _ready():
	pass
	#print(points)

func height_to_offset(y_val : float):
	print(y_val)
	print(global_position.y)
	print (points)
	#print(global_position.y + points[0].y)
	
	if y_val >= (global_position.y + points[0].y):
		y_val = global_position.y + points[0].y + 0.01
	elif y_val <= (global_position.y + points[points.size() -1].y):
		y_val = global_position.y + points[points.size() -1].y - 0.01
	$path/pos.offset = (global_position.y + points[0].y) - y_val
	print($path/pos.offset)

func get_pos():
	return $path/pos.global_position

func get_progress():
	return $path/pos.unit_offset

func move_offset(delta_y : float):
	$path/pos.offset -= delta_y
	if $path/pos.unit_offset >= 1.0 or $path/pos.unit_offset <= 0.0:
		return true
	else:
		return false
