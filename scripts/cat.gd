extends CharacterBody2D

@export var speed: float = 70
@onready var taskbar = $"../../gui/taskbar"

var player: Node2D
var ch: AnimatedSprite2D
var hitbox = 0
var health = 1


func _ready() -> void:
	player = $"../../player1"
	ch = $ch


func _physics_process(delta: float) -> void:
	if player == null:
		return

	var direction: Vector2 = player.global_position - global_position
	var distance: float = direction.length()

	if distance > 20:
		direction = direction.normalized()
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()

	if velocity == Vector2.ZERO:
		ch.play("idle")
	else:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				ch.play("right")
			else:
				ch.play("left")
		else:
			if velocity.y > 0:
				ch.play("down")
			else:
				ch.play("up")
	#ch.play()


func _on_area_body_entered(body: Node2D) -> void:
	player.health += 1
	print(player.health)

func _on_damage_body_entered(body: Node2D) -> void:
	hitbox = 1

func _on_damage_body_exited(body: Node2D) -> void:
	hitbox = 0

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("action") and hitbox == 1:
		for i in taskbar.get_children():
			if i.button_pressed && i.get_child(0).texture == load("res://assets/items/Small Knife.png") :
				health -= 1
				break

	if(!health):
		self.queue_free()
		
