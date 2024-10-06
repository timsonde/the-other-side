extends Area2D

@export var dialog_key: String = ""
var area_active = false



func _input(event) -> void:
	if area_active and event.is_action_pressed("ui_accept"):
		SignalBus.emit_signal("display_dialog", dialog_key)
		print("Key: " + dialog_key)

func _on_DialogArea_entered(area: Area2D) -> void:
	area_active = true

func _on_DialogArea_exited(area: Area2D) -> void:
	area_active = false
	SignalBus.emit_signal("dialog_area_exited")
