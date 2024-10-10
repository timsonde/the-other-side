class_name SceneManager extends Node

var player: Player
var last_scene_name: String

const scene_dir_path = "res://assets/scenes/locations/"

func change_scene(from: BaseScene, to_scene_name: String) -> void:
	player = from.player
	last_scene_name = from.name
	player.get_parent().remove_child(player)
	
	var full_path = scene_dir_path + to_scene_name + ".tscn"
	from.get_tree().call_deferred("change_scene_to_file",full_path)
