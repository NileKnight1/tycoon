extends Node2D


@onready var hearts = $gui/hearts
@onready var player = $player1
@onready var taskbar = $gui/taskbar
@onready var speaker = $gui/nar/speaker
@onready var speech = $gui/nar/speech

var current_scene = 1

func _ready() -> void:
	refresh_health()

func sp(t1, t2):
	$sounds/pop.play()
	speaker.text = t1
	speech.text = t2
	

func refresh_health():
	
	for i in range(global.player_health):
		
		hearts.get_child(i).visible = 1
		hearts.get_child(i).play("true")
		
		if(player.health <= i):
			hearts.get_child(i).play("false")
			

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



func click(): $sounds/click.play()
func error(): $sounds/error.play()
