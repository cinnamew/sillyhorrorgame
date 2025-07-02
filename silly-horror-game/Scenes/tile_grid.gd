extends Node2D

var grid = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]

func _ready():
	generate_grid()
	
func generate_grid():
	var tileMap: TileMapLayer = $tilemap
	for x in range(len(grid)):
		for y in range(len(grid[0])):
			tileMap.set_cell(Vector2i(x, y), 0, Vector2i(1, 1))
			
