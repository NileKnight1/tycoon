extends Node2D


@onready var sell_button = $gui/sell

@onready var sell_button_text = $gui/sell/Label

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
@onready var houses = $map/tilemaps/houses
@onready var taskbar = $gui/taskbar

var play_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(workers)
	#chests.start()
	#print("bruhhhh")
	#print(sell_button_text.position.y)
	
	start_game()
	player2.no_move = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(chest1.is_ready)
	#print(player.position)
	#play_pos = player.position
	
	pass

func start_game():
	#print("Mhm")
	
	chests.get_child(global.workers_count).start()
	chests.get_child(global.workers_count).visible = 1
	for j in chests.get_child(global.workers_count).cols:
		j.set_deferred("disabled", 0)
		
	houses.get_child(global.workers_count).enabled = 1

	global.workers_count +=1
	


func add_worker():
	start_game()



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
	camera2.enabled = 1

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scripts/node_2d.tscn")


func _on_back_pressed() -> void:
	camera.enabled = 1
	camera2.enabled = 0
	player.no_move = 0
	player.position.x = 76
	player.position.y = -68
	


func _on_add_pressed() -> void:
	add_worker()


func _on_sell_button_down() -> void:
	sell_button_text.position.y = 280
	#print(sell_button_text.position.y)
	pass
	



func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("t1"):
		taskbar.get_child(0).button_pressed = 1
	elif Input.is_action_just_pressed("t2"):
		taskbar.get_child(1).button_pressed = 2
	elif Input.is_action_just_pressed("t3"):
		taskbar.get_child(2).button_pressed = 3
	



func _on_sell_button_up() -> void:
	sell_button_text.position.y = 218
	#print(sell_button_text.position.y)
	pass
	


func _on_button_1_toggled(toggled_on: bool) -> void:
	if toggled_on:
		for i in taskbar.get_children():
			if(i.get_index() == 0): continue
			i.button_pressed = 0
			

func _on_button_2_toggled(toggled_on: bool) -> void:
	if toggled_on:
		for i in taskbar.get_children():
			if(i.get_index() == 1): continue
			i.button_pressed = 0
			

func _on_button_3_toggled(toggled_on: bool) -> void:
	if toggled_on:
		for i in taskbar.get_children():
			if(i.get_index() == 2): continue
			i.button_pressed = 0
			
