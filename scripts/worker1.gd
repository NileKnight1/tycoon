extends CharacterBody2D


#@export var SPEED = global.player_speed
#@export var boost = global.player_boost

var SPEED = 100
var boost = 1

@onready var player = $sprite

var xpos = position.x
var ypos = position.y

#
#func _ready() -> void:
	#print(self.position)

var move_ = 0
var back = 0

func start():
	move_ = 1
	#print(move_)


func worker_back():
	back = 1


func move():
	
	if self.position.y > 30 + ypos:
		if move_ == 1:
			move_ = 2
	if self.position.x < -350 + xpos:
		if move_ == 2:
			move_ = 3
	if self.position.x > 50 + xpos:
		if move_ == 3:
			move_ = 4
	if self.position.x < 0 + xpos:
		if move_ == 4:
			move_ = 5
	if self.position.y < 0 + ypos:
		if move_ == 5:
			move_ = 0
			back = 0
	
	#
	#if (self.position.y < 30 && move_ == 0): 
		#move_ += 1
	#elif (self.position.x > -350 && move_ == 1):
		#move_ += 1	
	#elif(self.position.x < 50 && move_ == 2):
		#move_ += 1
	#elif(self.position.x > -1 && move_ == 3):
		#move_ += 1

var direction = 0
var direction2 = 0
var boost_check = 0
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
	velocity += get_gravity() * delta

	direction = 0
	direction2 = 0
	
	move()
	
	#print(move_)
	
	
	match move_:
		1: direction2 = 1
		2: direction = -1
		
	if back:
		match move_:
			3: direction = 1
			4: direction = -1
			5: direction2 = -1
		
	#print(move_)
	#print(self.position)
	
	#print(velocity)
	#if(self.position)
	
	if direction:
		if boost_check:
			velocity.x = direction * SPEED * boost
		else:
			velocity.x = direction * SPEED

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction2:
		if boost_check:
			velocity.y = direction2 * SPEED * boost
		else:
			velocity.y = direction2 * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if direction > 0:
		player.play("right")
	elif direction < 0:
		player.play("left")
	elif direction2 == -1:
		player.play("up")
	elif direction2 == 1:
		player.play("down")
	else:
		player.play("idle")
		
	move_and_slide()
