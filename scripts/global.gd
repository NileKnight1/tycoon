extends Node


var inventory = null

var font1 = load("res://temp2.ttf")
var font2 = load("res://temp.ttf")


var player_speed = 150
var player_boost = 3
var currency: int = 10

var chest_small_time = 0.1

var workers_count = 0

var button_normal = load("res://assets/ui/button_normal.png")
var button_hover = load("res://assets/ui/button_hover.png")
var button_disabled = load("res://assets/ui/button_disabled.png")
var button_pressed = load("res://assets/ui/button_pressed.png")





func update_currency(amount):
	#print("I came hered")
	currency += amount
	#print(currency)

var items = [
	# Weapons
	{"name": "Stick", 	"price": 75		, "sellable": true, "holdable": true,	"list": 2						},
	{"name": "Knife", "price": 75	, "sellable": true, "holdable": true,	"list": 2						},
	{"name": "Small Axe", "price": 75	, "sellable": true, "holdable": true,	"list": 2						},
	{"name": "Axe", 	"price": 75		, "sellable": true, "holdable": true,	"list": 2						},
	
	
	
	# Crops
	{"name": "Apple", 			"price": 5		, "sellable": true, "holdable": false,	"list": 1						},
	{"name": "Banana", 			"price": 5		, "sellable": true, "holdable": false,	"list": 1						},
	{"name": "Orange", 			"price": 5		, "sellable": true, "holdable": false,	"list": 1						},
	{"name": "Watermelon", 		"price": 5		, "sellable": true, "holdable": false,	"list": 1							},
	{"name": "Red Grape", 		"price": 5		, "sellable": true, "holdable": false,	"list": 1							},
	{"name": "Green Grape", 	"price": 5		, "sellable": true, "holdable": false,	"list": 1							},
	{"name": "Potato", 			"price": 5		, "sellable": true, "holdable": false,	"list": 1						},
	{"name": "Tomato", 			"price": 5		, "sellable": true, "holdable": false,	"list": 1						},
	{"name": "Kiwi", 			"price": 5		, "sellable": true, "holdable": false,	"list": 1					},
	{"name": "Lime", 			"price": 5		, "sellable": true, "holdable": false,	"list": 1					},
	{"name": "Lemon", 			"price": 5		, "sellable": true, "holdable": false,	"list": 1						},
	{"name": "Peach", 			"price": 5		, "sellable": true, "holdable": false,	"list": 1						},
	{"name": "Blueberry", 		"price": 5		, "sellable": true, "holdable": false,	"list": 1							},
	{"name": "Cherry", 			"price": 5		, "sellable": true, "holdable": false,	"list": 1						},
	{"name": "Eggplant", 		"price": 5		, "sellable": true, "holdable": false,	"list": 1						},
	
	
	
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
