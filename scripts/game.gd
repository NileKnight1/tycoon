extends Node2D


@onready var sell_button = $gui/sell
@onready var inventory = $gui/inventory
@onready var currency_label = $gui/currency


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	sell_button.visible = 1

func _on_area_2d_body_exited(body: Node2D) -> void:
	sell_button.visible = 0
	if(inventory.inventory_opened == 2):
		inventory.inventory_opened = 0
		inventory.inventory.visible = 0
	
