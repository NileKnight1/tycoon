extends Node


var inventory = null


var player_speed = 150
var player_boost = 3
var currency: int = 10

var chest_small_time = 30



func update_currency(amount):
	#print("I came hered")
	currency += amount
	print(currency)

var items = [
	{"name": "Apple", "price": 5},
	{"name": "Banana", "price": 5},
	{"name": "Orange", "price": 5},
	{"name": "Watermelon", "price": 5},
	{"name": "Grape", "price": 5},
	
]

var tiers = [
	["Apple", "Banana", "Grape", "Orange", "Watermelon"]
]

func chest_opened(tier):
	var chest_item = random_chest_item()
	inventory._update_inventory(chest_item, 1)

func random_chest_item():
	var num = randi() % 5
	return tiers[0][num]

#
#func _process(delta: float) -> void:
	#pass
