extends CharacterBody2D

@onready var sprite = $sprite
#
#
#func _ready() -> void:
	#global.worker_move(self)


var SPEED = 50

func _physics_process(delta: float) -> void:
	#velocity += get_gravity() * delta
	
	#var direction := Input.get_axis("left", "right")

	
	#if(Input.is_action_pressed("interact")):
		#velocity.x = 1 * SPEED
	#else:
		#pass
		##velocity.x = move_toward(velocity.x, 0, SPEED)

	sprite.play("down")
	
	move_and_slide()
