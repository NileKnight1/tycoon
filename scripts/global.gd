extends Node


var inventory = null


var player_speed = 150
var player_boost = 3
var currency: int = 10

var chest_small_time = 0.1

var workers_count = 0


func update_currency(amount):
	#print("I came hered")
	currency += amount
	#print(currency)

var items = [
	{"name": "Apple", "price": 5},
	{"name": "Banana", "price": 5},
	{"name": "Orange", "price": 5},
	{"name": "Watermelon", "price": 5},
	{"name": "Red Grape", "price": 5},
	{"name": "Green Grape", "price": 5},
	{"name": "Potato", "price": 5},
	{"name": "Tomato", "price": 5},
	{"name": "Kiwi", "price": 5},
	{"name": "Lime", "price": 5},
	{"name": "Lemon", "price": 5},
	{"name": "Peach", "price": 5},
	{"name": "Blueberry", "price": 5},
	{"name": "Cherry", "price": 5},
	{"name": "Eggplant", "price": 5},
	
	
	
]

var tiers = [
	["Apple", "Banana", "Red Grape", "Orange", "Watermelon",
	"Green Grape", "Potato", "Tomato",
	"Kiwi", "Lime", "Lemon", "Peach",
	"Blueberry", "Cherry", "Eggplant"
	
	]
]

func chest_opened(tier):
	var chest_item = random_chest_item()
	inventory._update_inventory(chest_item, 1)

func random_chest_item():
	var num = randi() % len(tiers[0])
	return tiers[0][num]

#
#func _process(delta: float) -> void:
	#pass
