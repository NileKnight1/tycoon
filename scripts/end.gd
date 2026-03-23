extends Node2D


func _ready() -> void:
	var time = int(global.time)

	var hours = time / 3600
	var minutes = (time % 3600) / 60
	var seconds = time % 60

	$Label.text = "You finished in %02d:%02d:%02d" % [hours, minutes, seconds]



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/village.tscn")
