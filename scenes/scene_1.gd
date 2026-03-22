extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("lolo")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	$"../player1".no_move = 1
	$"../player1".player.play("default")
	
