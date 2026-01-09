extends CharacterBody2D

@onready var chest = $chest
@onready var col2 = $col2
@onready var timer = $timer
@onready var label = $label
@onready var game = $"../../.."

var tier = 1
var is_open = 0
var is_ready = 0
var inarea = 0
var _show = 1
var back = 0

var cols = []

var stopped



func _ready() -> void:
	get_cols()

func start():
	if(!timer.time_left):
		timer.start(global.chest_small_time)
		game.get_chest(get_index())

func get_cols(node = self):
	for child in node.get_children():
		if child is CollisionShape2D:
			cols.append(child)
			print(self)
			print(child)
		get_cols(child)
	

func open():
	
	is_open = 1
	is_ready = inarea && is_open
	_show = 0
	label.visible = 0
	chest.play("open")
	col2.set_deferred("disabled", 0)
	
func close():
	back = 0
	game.get_chest(get_index())
	
	print("I came here")
	
	is_open = 0
	is_ready = inarea && is_open
	_show = 1
	label.visible = 1
	
	global.chest_opened(tier)
	
	chest.play("close")
	col2.set_deferred("disabled", 1)
	timer.start(global.chest_small_time)

func _process(delta: float) -> void:
	if(stopped): return
	
	if (timer.time_left < 5 && !back):
		game.back(get_index())
		back = 1
	
	if(!inarea): return
	
	if(_show):
		label.text = str(int(timer.time_left)) + "s"
	
	if Input.is_action_just_pressed("interact") and timer.is_stopped():
		#print("Closed")
		close()
	
func _on_area_body_entered(body: Node) -> void:
	#print("Im here")
	if(_show):
		label.visible = 1
	inarea = 1
	is_ready = inarea && is_open

func _on_area_body_exited(body: Node2D) -> void:
	#print("im not here")
	label.visible = 0
	inarea = 0
	is_ready = inarea && is_open
	



		

func _on_timer_timeout() -> void:
	open()
