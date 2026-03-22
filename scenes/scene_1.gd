extends Node

var sceneNum = 0

@onready var speaker = $"../gui/nar/speaker"
@onready var speech = $"../gui/nar/speech"
@onready var nar = $"../gui/nar"
@onready var v = $".."
@onready var tasks = $"../gui/tasks"
@onready var task = $"../gui/tasks/task"

@onready var player = $"../player1"
@onready var rita = $rita
@onready var rita_father = $"rita father"


func _ready() -> void:
	#sceneNum = 20
	#scene()
	pass

func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("action"):
		if(sceneNum):
			scene()
	 
	if Input.is_action_just_pressed("action2"):
		if(sceneNum > 1):
			sceneNum -= 2
			scene()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if v.current_scene != 1: return
	player.no_move = 1
	player.player.play("default")
	scene()


func scene():
	sceneNum += 1
	match sceneNum:
		1:
			nar.visible = 1
			v.sp("Andro", "Umm Hello!")
		2: v.sp("Girl", "Hello?")
		3: v.sp("Girl", "Do I know you?")
		4: v.sp("Andro", "No, don't you want?")
		5: v.sp("Girl", "Mhm.")
		6: v.sp("Andro", "You're so cute!")
		7: v.sp("Girl", "Thanks.")
		8: v.sp("Andro", "Wanna walk?")
		9: v.sp("Girl", "I'm sorry I can't.")
		10: v.sp("Andro", "Why?")
		11: v.sp("Girl", "My father ...")
		12: v.sp("Girl", "You should ask him.")
		13: v.sp("Andro", "Where do you live?")
		14: v.sp("Girl", "We live in the wealthy part of the village.")
		15: v.sp("Andro", "Great .. I'm Andro.")
		16: v.sp("Rita", "I'm Rita!")
		17: v.sp("Rita", "I gotta go now .. Bye!")
		18: v.sp("Andro", "Bye.")
		
		
		_: 
			nar.visible = 0
			player.no_move = 0
			v.current_scene +=1
			rita.position = Vector2(-1720, -935)
			tasks.visible = 1
			task.text = "- Find Rita's house."
			rita_father.visible = 1
			sceneNum = 0
			


func _on_scene_2_body_entered(body: Node2D) -> void:
	print(body)
	if v.current_scene != 2: return
	player.no_move = 1
	player.player.play("default")
	tasks.visible = 0
	scene2()
	
func scene2():
	sceneNum += 1
	
	match sceneNum:
		1:
			nar.visible = 1
			v.sp("Andro", "Hello Mister.")
		2: v.sp("Rita's Father", "Hello Kid.")
		3: v.sp("Girl", "Do I know you?")
		4: v.sp("Andro", "No, don't you want?")
		5: v.sp("Girl", "Mhm.")
		6: v.sp("Andro", "You're so cute!")
		7: v.sp("Girl", "Thanks.")
		8: v.sp("Andro", "Wanna walk?")
		9: v.sp("Girl", "I'm sorry I can't.")
		10: v.sp("Andro", "Why?")
		11: v.sp("Girl", "My father ...")
		12: v.sp("Girl", "You should ask him.")
		13: v.sp("Andro", "Where do you live?")
		14: v.sp("Girl", "We live in the wealthy part of the village.")
		15: v.sp("Andro", "Great .. I'm Andro.")
		16: v.sp("Rita", "I'm Rita!")
		17: v.sp("Rita", "I gotta go now .. Bye!")
		18: v.sp("Andro", "Bye.")
		
		
		_: 
			nar.visible = 0
			player.no_move = 0
			v.current_scene +=1
			rita.position = Vector2(-1720, -935)
			tasks.visible = 1
			task.text = "- Find Rita's house."
			rita_father.visible = 1
			sceneNum = 0
