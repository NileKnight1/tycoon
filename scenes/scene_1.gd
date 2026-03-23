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
@onready var weird = $weird
@onready var black_screen = $"../gui/end"


var weapons_man_scene = 0
var heart_scene = 0
var temp = 0

func _ready() -> void:
	#sceneNum = 20
	#scene()
	#v.current_scene =AAAsAAa 4
	if global.currency >= 10000:
		win()
	else:
		global.player_health = 3
		v.current_scene = 1
		task.text = "- Explore the village."
		global.time = 0

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

func win():
	rita.position = Vector2(-1720, -935)
	rita.visible = 0
	weird.visible = 0
	rita_father.visible = 1
	v.current_scene +=1
	sceneNum = 0
	nar.visible = 0
	tasks.visible = 1
	player.no_move = 0
	task.text = "- Meet Rita's father."
	player.health = global.player_health
	v.current_scene = 5
	
	

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
					task.text = "- Get money."
					weird.visible = 1
					player.no_move = 0
		3: 
			match sceneNum:
				1:
					nar.visible = 1
					v.sp("Weird Man", "Hey kid.")
				2: v.sp("Andro", "Hello sir.")
				3: v.sp("Weird Man", "Why are you sad?")
				4: v.sp("Andro", "I have no money and I wanna marry a cute girl.")
				5: v.sp("Weird Man", "Can you fight?")
				6: v.sp("Andro", "Huh why?")
				7: v.sp("Weird Man", "I have a job.")
				8: v.sp("Andro", "And what's it?")
				9: v.sp("Weird Man", "We'll fight the giant cats .. I mean you will.")
				10: v.sp("Andro", "But we can't leave the village.")
				11: v.sp("Weird Man", "Hahaha .. don't worry I have my way.")
				12: v.sp("Andro", "I gotta think.")
				13: v.sp("Weird Man", "If you're in, pay me a visit again.")
				14: v.sp("Andro", "Okay see you.")
				
				_: 
					v.current_scene +=1
					rita.visible = 1
					sceneNum = 0
					nar.visible = 0
					tasks.visible = 1
					task.text = "- Explore the village or leave."
					
					player.no_move = 0
		4: 
			match sceneNum:
				1:
					nar.visible = 1
					v.sp("Weird Man", "Ready?")
				2: v.sp("Andro", "Ready.")
				3: v.sp("Weird Man", "Let's go.")
				4: black_screen.visible = 1
					
				
				_: 

					get_tree().change_scene_to_file("res://scenes/game.tscn")
		5:
			match sceneNum:
				1:
					nar.visible = 1
					v.sp("Rita's Father" , "Welcome kid.")
				2: v.sp("Andro" , "Hey.")
				3: v.sp("Andro" , "I'm back with what you've asked.")
				4: v.sp("Rita's Father" , "I knew you would.")
				5: v.sp("Rita's Father" , "Your wedding is next week.")
				6: v.sp("Rita's Father" , "Now I'll let you talk.")
				7:
					v.sp("Andro" , "Thank you.")
					rita.visible = 0
					rita_father.visible = 1
				8:
					v.sp(" ", " ")
					rita.visible = 1
					rita_father.visible = 0
				9: v.sp("Rita", "Hi Andro!")
				10: v.sp("Andro", "Hey Rita!")
				11: v.sp("Rita", "Are you fine?")
				12: v.sp("Andro", "I'm alright.")
				13: v.sp("Rita", "Did my father agree?")
				14: v.sp("Andro", "Yes we'll marry next week.")
				15: v.sp("Rita", "Oh my God!")
				16: 
					v.sp("Andro", "I love you.")
					black_screen.visible = 0
				17: 
					v.sp("Rita", "I love you too.")
					black_screen.visible = 1
				18: 
					global.currency = 0
					get_tree().change_scene_to_file("res://scenes/end.tscn")
				

				
		
		
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
					global.bonus_stick = 1
					
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
		203:
			match sceneNum:
				1: 
					nar.visible = 1
					tasks.visible = 0
					v.sp("Rita", "Hey Andro.")
				2: v.sp("Andro", "Hi Rita.")
				3: v.sp("Rita", "What did my father tell you?")
				4: v.sp("Andro", "He told me to get money and then he will let me marry you.")
				5: v.sp("Rita", "REALLY!!!")
				6: v.sp("Andro", "Yeah.")
				7: v.sp("Rita", "And what are you planning to do?")
				8: v.sp("Andro", "I met a man he has a job for me .. We will go out of the village.")
				9: v.sp("Rita", "OUTSIDE IS SO DANGEROUS")
				10: v.sp("Andro", "I don't care .. I'll marry you whatever it costs.")
				11: v.sp("Rita", "Take care Andro .. My heart is with you.")
				12: 
					global.player_health += 1
					player.health = global.player_health
					
					v.refresh_health()
					v.sp("Andro", "Thanks Rita.")
					
				13: 
					rita.visible = 0
					v.sp("Rita", "Bye Bye.")
					
					
				_:
					v.current_scene = temp
					nar.visible = 0
					tasks.visible = 1
					rita.visible = 0
					task.text = "- Leave the village with the Weird."
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


func _on_scene_5_body_entered(body: Node2D) -> void:
	if v.current_scene != 3 && v.current_scene != 4: return
	player.no_move = 1
	player.player.play("default")
	tasks.visible = 0
	scene()


func _on_scene_6_body_entered(body: Node2D) -> void:
	if v.current_scene != 4: return
	if heart_scene: return
	heart_scene = 1
	player.no_move = 1
	player.player.play("default")
	tasks.visible = 0
	
	temp = v.current_scene
	v.current_scene = 203
	scene()


func _on_scene_7_body_entered(body: Node2D) -> void:
	if v.current_scene != 5: return
	player.no_move = 1
	player.player.play("default")
	tasks.visible = 0

	scene()
