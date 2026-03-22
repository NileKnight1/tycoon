extends Node

var sceneNum = 0

@onready var speaker = $"../gui/nar/speaker"
@onready var speech = $"../gui/nar/speech"
@onready var nar = $"../gui/nar"
@onready var v = $".."
@onready var tasks = $"../gui/tasks"
@onready var task = $"../gui/tasks/task"
@onready var inventory = $"../gui/inventory"

@onready var player = $"../player1"
@onready var rita = $rita
@onready var rita_father = $"rita father"
@onready var weapons_man = $"weapons man"




var weapons_man_scene = 0
var temp = 0

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
	match v.current_scene:
		1:
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
		2: 
			match sceneNum:
				1:
					nar.visible = 1
					v.sp("Andro", "Hello Mister!")
				2: v.sp("Rita's Father", "Hello, Can I help you?")
				3: v.sp("Andro", "Actually ...")
				4: v.sp("Rita", "He wants me dad.")
				5: v.sp("Rita's Father", "Hahaha, you don't live here, do you?")
				6: v.sp("Andro", "No I live in the other village half.")
				7: v.sp("Rita's Father", "Hahaha, go away kid go away.")
				8: v.sp("Rita", "But dad! He is gentle.")
				9: v.sp("Rita's Father", "Go inside girl.")
				10: 
					rita.visible = 1
					v.sp("Rita", "Okay dad.")
				11: 
					rita.visible = 0
					v.sp("Rita's Father", "Look kid ...")
				12: v.sp("Andro", "Yes Mister.")
				13: v.sp("Rita's Father", "If you can get 10K$, I'll marry you to her.")
				14: v.sp("Andro", "But that's too much.")
				15: v.sp("Rita's Father", "My girl deserves more.")
				16: v.sp("Rita's Father", "Bye.")
				
				_: 
					v.current_scene +=1
					rita_father.visible = 0
					sceneNum = 0
					nar.visible = 0
					tasks.visible = 1
					task.text = "- Explore the village."
					
					player.no_move = 0
		201:
			match sceneNum:
				1: 
					nar.visible = 1
					tasks.visible = 0
					v.sp("Weapons Dealer", "How are you doing kid?")
				2: v.sp("Andro", "I'm good and you?")
				3: v.sp("Weapons Dealer", "You need help?")
				4: v.sp("Andro", "I'm fine.")
				5: 
					v.sp("Weapons Dealer", "Take this stick .. You'll need it I believe.")
					inventory._update_inventory("Stick", 1)
					
				6: v.sp("Andro", "Thank you!")
				7: v.sp("Weapons Dealer", "Welcome!")
				
				
					
					
				_:
					v.current_scene = temp
					nar.visible = 0
					tasks.visible = 1
					sceneNum = 0
					player.no_move = 0
		202:
			match sceneNum:
				1: 
					nar.visible = 1
					tasks.visible = 0
					v.sp("Village Guard", "You can't leave the village kid.")
					
				_:
					v.current_scene = temp
					nar.visible = 0
					tasks.visible = 1
					sceneNum = 0
					player.no_move = 0


func _on_scene_2_body_entered(body: Node2D) -> void:
	if v.current_scene != 2: return
	player.no_move = 1
	player.player.play("default")
	tasks.visible = 0
	scene()
	


func _on_scene_3_body_entered(body: Node2D) -> void:
	if weapons_man_scene: return
	weapons_man_scene = 1
	player.no_move = 1
	player.player.play("default")
	tasks.visible = 0
	
	temp = v.current_scene
	v.current_scene = 201
	scene()


func _on_scene_4_body_entered(body: Node2D) -> void:
	player.no_move = 1
	player.player.play("default")
	tasks.visible = 0
	
	temp = v.current_scene
	v.current_scene = 202
	scene()
