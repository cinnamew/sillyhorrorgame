extends Node2D

@onready
var grid = $TileGrid

@onready
var cursor = $Cursor

@onready
var tile_grid : TileGrid = $tile_grid

const SCALING = 8

var cursor_pos = Vector2(4, 3)


func _ready():
	pass
	
func update_cursor_pos():
	# actual vector math idk
	var pos = cursor_pos + Vector2(1, 0)
	pos = Vector2(pos.x * 16 - pos.y * 16, pos.x * 8 + pos.y * 8)
	pos += Vector2(0, -8) # Move the cursor up slightly
	cursor.position = grid.transform * grid.layers[2].transform * pos
	

func _process(delta):
	if Input.is_action_just_pressed("Left"):
		cursor_pos += Vector2(-1, 0)
	if Input.is_action_just_pressed("Right"):
		cursor_pos += Vector2(1, 0)
	if Input.is_action_just_pressed("Up"):
		cursor_pos += Vector2(0, -1)
	if Input.is_action_just_pressed("Down"):
		cursor_pos += Vector2(0, 1)
	
	update_cursor_pos()
