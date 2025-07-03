class_name TileGrid
extends Node2D

const CHUNK_SIZE = 8
const BLOCK_HEIGHT = 8
const BLOCK_WIDTH = 16

var layers : Array[TileMapLayer] = []
var grid = []

var rng = RandomNumberGenerator.new()

enum Tiles {
	TILE_ICE,
	TILE_DIRT,
	TILE_GRASS,
	TILE_STONE,
	TILE_WATER,
}

const tile_data = {
	Tiles.TILE_DIRT: Vector2i(3,0),
	Tiles.TILE_GRASS: Vector2i(0, 2),
	Tiles.TILE_STONE: Vector2i(8, 5),
}
func get_tile(layer_id : int, x, y):
	return layers[layer_id].get_cell_tile_data(Vector2i(x, y))
	
func get_tile_type(layer_id : int, x, y):
	var tile = get_tile(layer_id, x, y)
	
	
func _ready():
	setup_layers()
	#generate_map()
	#render_grid()

func generate_flat_chunk(tile: Tiles):
	var layer = []
	for x in range(CHUNK_SIZE):
		var row = []
		for y in range(CHUNK_SIZE):
			row.append(tile)
		layer.append(row)
	return layer
	
func generate_bedrock():
	return generate_flat_chunk(Tiles.TILE_STONE)
	
func generate_dirt():
	return generate_flat_chunk(Tiles.TILE_DIRT)

func generate_grass():
	return generate_flat_chunk(Tiles.TILE_GRASS)
		
func generate_map():
	print("Generating Map")
	grid.append(generate_bedrock())
	grid.append(generate_dirt())
	grid.append(generate_grass())
	
# Loads all the layers in $Layers into the layers array
func setup_layers():
	var l = $Layers
	var i = 0
	for child in l.get_children():
		if child is TileMapLayer:
			child.position.y = i * -BLOCK_HEIGHT
			layers.append(child)
		i += 1

# Render grid from array
# NOTE: currently using premade levels	
func render_grid():
	print(layers)
	for z in range(len(grid)):
		for y in range(len(grid[z])):
			for x in range(len(grid[z][y])):
				layers[z].set_cell(Vector2i(x, y), 0, tile_data[grid[z][y][x]])
			
