extends Node2D

func _on_workers_pressed() -> void:
	global.running = 1
	get_tree().change_scene_to_file("res://scenes/village.tscn")
