extends Node

var sceneNum = 0

@onready var speaker = $"../gui/nar/speaker"
@onready var speech = $"../gui/nar/speech"
@onready var nar = $"../gui/nar"
@onready var v = $".."


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	$"../player1".no_move = 1
	$"../player1".player.play("default")
	scene()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("action"):
		if(sceneNum):
			scene()
	 
	if Input.is_action_just_pressed("action2"):
		if(sceneNum > 1):
			sceneNum -= 2
			scene()
	
		
		
func scene():
	sceneNum += 1
	
	match sceneNum:
		1:
			nar.visible = 1
			v.sp("Andro", "Umm Hello!")
		2:
			speaker.text = "Rita"
			speech.text = "Hello?"
		
