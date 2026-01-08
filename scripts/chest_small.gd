extends CharacterBody2D

@onready var chest = $chest
@onready var col2 = $col2
@onready var timer = $timer
@onready var label = $label


var tier = 1
var is_open = 0
var is_ready = 0
var inarea = 0
var _show = 1

func _ready() -> void:
	timer.start(global.chest_small_time)

func open():
	
	is_open = 1
	is_ready = inarea && is_open
	_show = 0
	label.visible = 0
	chest.play("open")
	col2.set_deferred("disabled", 0)
	
func close():
	is_open = 0
	
	is_ready = inarea && is_open
	_show = 1
	label.visible = 1
	
	global.chest_opened(tier)
	
	chest.play("close")
	col2.set_deferred("disabled", 1)
	timer.start(global.chest_small_time)

func _process(delta: float) -> void:
	if(!inarea): return
	
	if(_show):
		label.text = str(int(timer.time_left)) + "s"
	
	if Input.is_action_just_pressed("interact") and timer.is_stopped():
		print("Closed")
		close()
	
func _on_area_body_entered(body: Node) -> void:
	#print("Im here")
	if(_show):
		label.visible = 1
	inarea = 1
	is_ready = inarea && is_open

func _on_area_body_exited(body: Node2D) -> void:
	label.visible = 0
	inarea = 0
	is_ready = inarea && is_open
	



		

func _on_timer_timeout() -> void:
	open()
