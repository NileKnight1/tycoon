extends Node

var player_speed = 150
var player_boost = 3

var currency = 33

var chest_small_time = 3

func update_currency(amount):
	#print("I came hered")
	currency += amount
	print(currency)

var items = [
	{"name": "Apple", "price": 7}
]

#
#func _ready() -> void:
	#pass # Replace with function body.
#
#
#func _process(delta: float) -> void:
	#pass
