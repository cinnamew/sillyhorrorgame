extends Node2D

@onready
var grid = $TileGrid

@onready
var player = $Character

@onready
var tile_grid : TileGrid = $tile_grid

const SCALING = 8




func _ready():
	pass
	
func update_cursor_pos():
	# actual vector math idk
	var pos = player.pos + Vector2(1, 0)
	pos = Vector2(pos.x * 16 - pos.y * 16, pos.x * 8 + pos.y * 8)
	pos += Vector2(0, -8) # Move the cursor up slightly
	player.position = grid.transform * grid.layers[2].transform * pos
	

func _process(delta):
	if Input.is_action_just_pressed("Rotate_Left"):
		grid.render_grid()
	if Input.is_action_just_pressed("Rotate_Left"):
		grid.render_grid()
	
	update_cursor_pos()
