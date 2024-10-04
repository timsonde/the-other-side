extends CanvasLayer

@export var scene_text_file: String

const path = "res://assets/dialogs/"

var scene_text = {}
var selected_text = []
var in_progress = false

@onready var background = $Background
@onready var text_label = $TextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	background.visible = false
	text_label.text = ""
	scene_text = load_scene_text()
	SignalBus.display_dialog.connect(on_display_dialog)

func load_scene_text():
	var full_path = path+scene_text_file+".json"
	
	if FileAccess.file_exists(full_path):
		var file = FileAccess.open(full_path, FileAccess.READ)
		return JSON.parse_string(file.get_as_text())

func show_text() -> void:
	text_label.text = selected_text.pop_front()

func next_line() -> void:
	if selected_text.size() > 0:
		show_text()
	else:
		finish()

func finish() -> void:
	text_label.text = ""
	background.visible = false
	in_progress = false
	get_tree().paused = false

func on_display_dialog(text_key: String) -> void:
	if in_progress:
		next_line()
	else:
		get_tree().paused = true
		background.visible = true
		in_progress = true
		selected_text = scene_text[text_key].duplicate()
		show_text()
