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

@onready var cooldown = $player1/cooldown
@onready var hearts = $gui/hearts
@onready var hearts_cooldown = $player1/hearts
@onready var cats = $cats

@onready var cats_att = $cats_att
@onready var cats_time_left = $gui/timer

@onready var cat_scene = preload("res://objects/cat.tscn")
@onready var cat_script = preload("res://scripts/cat.gd")
	


var play_pos
var cats_num = 0
var killed_cats_all = 0
var killed_cats = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#cooldown.start()
	
	
	
	#print(workers)
	#chests.start()
	#print("bruhhhh")
	#print(sell_button_text.position.y)
	
	start_game()
	
	#spawn_cat()
	#spawn_cat()
	
	
	
	player2.no_move = 1

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(chest1.is_ready)
	#print(player.position)
	#play_pos = player.position
	#print(cooldown.wait_time)
	
	var rem = int(cats_att.time_left)
	var min = str(rem / 60)
	var sec = str(rem % 60)
	#
	#if(rem < 119):
		#title.hide()
	#
	if(int(sec)>9):
		cats_time_left.text = "0" + min + ":" + sec
	else:
		cats_time_left.text = "0" + min + ":0" + sec
		
	
	
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
		$player1/hand.texture = taskbar.get_child(0).get_child(0).texture
		
	elif Input.is_action_just_pressed("t2"):
		taskbar.get_child(1).button_pressed = 2
		$player1/hand.texture = taskbar.get_child(1).get_child(0).texture
			
	elif Input.is_action_just_pressed("t3"):
		taskbar.get_child(2).button_pressed = 3
		$player1/hand.texture = taskbar.get_child(2).get_child(0).texture
			
	if Input.is_action_just_pressed("action"):
		check_hit_on_cats()
		_hit()


func _on_sell_button_up() -> void:
	sell_button_text.position.y = 218
	#print(sell_button_text.position.y)
	pass
	


func _on_button_1_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$player1/hand.texture = taskbar.get_child(0).get_child(0).texture
		
		for i in taskbar.get_children():
			if(i.get_index() == 0): continue
			i.button_pressed = 0

func _on_button_2_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$player1/hand.texture = taskbar.get_child(1).get_child(0).texture
		
		for i in taskbar.get_children():
			if(i.get_index() == 1): continue
			i.button_pressed = 0

func _on_button_3_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$player1/hand.texture = taskbar.get_child(2).get_child(0).texture
		
		for i in taskbar.get_children():
			if(i.get_index() == 2): continue
			i.button_pressed = 0



func _hit():
	if cooldown.time_left: return
	
	cooldown.start(0.5)
	
	player.get_node("hand").position.y += 3
	await get_tree().create_timer(0.1).timeout
	player.get_node("hand").position.y -= 3
		


func hit(cat):
	
	
	if inventory.inventory_opened: return
	#print(2)
	
	if cooldown.time_left: return
	_hit()
	#print(3)
	#if cooldown.time_left: return

	print(cat.hitbox)
	
	if(!cat.hitbox): return
	
	
	for i in taskbar.get_children():
		if i.button_pressed && i.get_child(0).texture == load("res://assets/items/Small Knife.png") :
			cat.health -= 1
			break

	if(!cat.health):
		cat.queue_free()



func player_hit():
	
	if hearts_cooldown.time_left: return
	if player.health == 0:
		print("Dead")
		return
		
	player.health -= 1
	hearts_cooldown.start()
	
	for i in range(3-player.health):
		hearts.get_child(i).play("false")

func spawn_cat(x, y):
	var new_cat = cat_scene.instantiate()
	#print("Hi")
	new_cat.set_script(cat_script)
	cats.add_child(new_cat)
	
	new_cat.position = Vector2(x, y)
	

func _on_cats_att_timeout() -> void:
	cats_attack()
	
func cats_attack():
	cats_num += 2
	
	for i in range(cats_num):
		spawn_cat(
		randi_range(-470, -315),
		randi_range(-66, 271)
		)

func check_hit_on_cats():
	if inventory.inventory_opened: return
	if cooldown.time_left: return
	
	_hit()
	
	for cat in cats.get_children():
		if cat.hitbox:
			for i in taskbar.get_children():
				if i.button_pressed && i.get_child(0).texture == load("res://assets/items/Small Knife.png"):
					cat.health -= 1
					if cat.health <= 0:
						cat.queue_free()
						killed_cats_all += 1
						killed_cats += 1
						if killed_cats == cats_num:
							killed_cats = 0
							cats_att.start()
						
					break
			break
	
