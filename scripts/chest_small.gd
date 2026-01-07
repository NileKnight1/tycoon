extends CharacterBody2D

@onready var chest = $chest
@onready var col2 = $col2
@onready var timer = $timer

var inarea = 0

func _ready() -> void:
	timer.start(global.chest_small_time)

func open():
	chest.play("open")
	col2.set_deferred("disabled", 0)
	
func close():
	chest.play("close")
	col2.set_deferred("disabled", 1)
	timer.start(global.chest_small_time)

func _process(delta: float) -> void:
	if(!inarea): return
	
	if Input.is_action_just_pressed("interact") and timer.is_stopped():
		print("Closed")
		close()
	
func _on_area_body_entered(body: Node) -> void:
	inarea = 1

func _on_area_body_exited(body: Node2D) -> void:
	inarea = 0



		

func _on_timer_timeout() -> void:
	open()
