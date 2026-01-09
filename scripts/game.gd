extends Node2D


@onready var sell_button = $gui/sell
@onready var inventory = $gui/inventory
@onready var currency_label = $gui/currency

#@onready var timer1 = $map/chests/timer1
#@onready var chest = $map/chests/chest

@onready var chests = $map/chests

@onready var player = $player1
@onready var player2 = $player2

@onready var camera = $player1/Camera2D
@onready var camera2 = $player2/Camera2D

@onready var workers = $map/workers



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(workers)
	#chests.start()
	
	start_game()
	player2.no_move = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(chest1.is_ready)
	pass

func start_game():
	#print("Mhm")
	for i in chests.get_child_count():
		chests.get_child(i).start()





func _on_area_2d_body_entered(body: Node2D) -> void:
	sell_button.visible = 1

func _on_area_2d_body_exited(body: Node2D) -> void:
	sell_button.visible = 0
	if(inventory.inventory_opened == 2):
		inventory.inventory_opened = 0
		inventory.inventory.visible = 0



func get_chest(index):
	#print(workers)
	workers.get_child(index).start()

func back(index):
	workers.get_child(index).worker_back()


#func _on_timer_1_timeout() -> void:
	#chest1.play("open")
	#pass


func _on_house_body_entered(body: Node2D) -> void:
	player.no_move = 1
	camera.enabled = 0
	#camera2.enabled = 1
	
	
	
	
	


func _on_house_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scripts/node_2d.tscn")
