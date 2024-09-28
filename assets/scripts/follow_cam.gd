extends Camera2D

@export var tilemap: TileMapLayer
@export var follow_node: Node2D

func _ready() -> void:
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.rendering_quadrant_size
	var worldSizeInPixels = mapRect.size * tileSize
	limit_right = worldSizeInPixels.x
	limit_bottom = worldSizeInPixels.y

func _process(delta: float) -> void:
	global_position = follow_node.global_position
