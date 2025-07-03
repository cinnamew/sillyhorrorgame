extends Node2D


const CHUNK_SIZE = 8
const NUM_CHUNKS = 3 # 3 x 3 chunks
const NUM_LAYERS = 3
const BLOCK_HEIGHT = 16

var layers = []
var grid = []

var rng = RandomNumberGenerator.new()

enum Tiles {
	TILE_DIRT,
	TILE_GRASS,
	TILE_ICE,
	TILE_STONE,
}

const tile_data = {
	Tiles.TILE_DIRT: Vector2i(3,0),
	Tiles.TILE_GRASS: Vector2i(0, 2),
	Tiles.TILE_STONE: Vector2i(8, 5),
}

func _ready():
	setup_layers()
	generate_map()
	render_grid()
	
func generate_map():
	print("Generating Map")
	# Bedrock phase
	var layer = []
	for x in range(CHUNK_SIZE):
		var row = []
		for y in range(CHUNK_SIZE):
			row.append(Tiles.TILE_STONE)
		layer.append(row)
	grid.append(layer)
	
	# Dirt Layer
	layer = []
	for x in range(CHUNK_SIZE):
		var row = []
		for y in range(CHUNK_SIZE):
			row.append(Tiles.TILE_DIRT)
		layer.append(row)
	grid.append(layer)
	
	# Grass Layer
	layer = []
	for x in range(CHUNK_SIZE):
		var row = []
		for y in range(CHUNK_SIZE):
			row.append(Tiles.TILE_GRASS)
		layer.append(row)
	grid.append(layer)
	
	
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
			
