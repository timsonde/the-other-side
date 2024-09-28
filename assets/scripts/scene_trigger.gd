class_name SceneTrigger extends Area2D

## Die Die Szene in die navigiert werden soll
@export var connected_scene: String

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		scene_manager.change_scene(get_owner(), connected_scene)
