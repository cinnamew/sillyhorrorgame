extends Node2D


const CHUNK_SIZE = 8
const NUM_CHUNKS = 3 # 3 x 3 chunks
const NUM_LAYERS = 3
const BLOCK_HEIGHT = 16

var layers = []
var grid = [
		   [[Tiles.TILE_DIRT, Tiles.TILE_DIRT, Tiles.TILE_DIRT], 
			[Tiles.TILE_DIRT, Tiles.TILE_DIRT, Tiles.TILE_DIRT], 
			[Tiles.TILE_DIRT, Tiles.TILE_DIRT, Tiles.TILE_DIRT],
			[Tiles.TILE_DIRT, Tiles.TILE_DIRT, Tiles.TILE_DIRT]],
			
		   [[Tiles.TILE_GRASS, Tiles.TILE_GRASS, Tiles.TILE_GRASS], 
			[Tiles.TILE_GRASS, Tiles.TILE_GRASS, Tiles.TILE_GRASS], 
			[Tiles.TILE_GRASS, Tiles.TILE_GRASS, Tiles.TILE_GRASS]]
			]

enum Tiles {
	TILE_DIRT,
	TILE_GRASS,
	TILE_ICE,
}

const tile_data = {
	Tiles.TILE_DIRT: Vector2i(3,0),
	Tiles.TILE_GRASS: Vector2i(0, 2)
}

func _ready():
	setup_layers()
	render_grid()
	
func setup_layers():
	layers.append($layer1)
	layers.append($layer2)
	layers.append($layer3)
	
func render_grid():
	print(layers)
	for z in range(len(grid)):
		for y in range(len(grid[z])):
			for x in range(len(grid[z][y])):
				layers[z].set_cell(Vector2i(x, y), 0, tile_data[grid[z][y][x]])
			
