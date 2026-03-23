extends Node


var inventory = null

var font1 = load("res://temp2.ttf")
var font2 = load("res://temp.ttf")


var player_speed = 350
var player_boost = 3
var player_health = 3
var bonus_stick = 0

var currency: int = 9995

var chest_small_time = 0.1

var workers_count = 0


var button_normal = load("res://assets/ui/button_normal.png")
var button_hover = load("res://assets/ui/button_hover.png")
var button_disabled = load("res://assets/ui/button_disabled.png")
var button_pressed = load("res://assets/ui/button_pressed.png")


var time := 0.0
var running := 1

func _process(delta):
	if running:
		time += delta


func update_currency(amount):
	#print("I came hered")
	currency += amount
	#print(currency)
	if currency >= 10000:
		inventory.win()

var items = [
	# Weapons
	{"name": "Stick", 	"price": 10		, "sellable": true, "holdable": true,	"list": 2						},
	{"name": "Knife", "price": 50	, "sellable": true, "holdable": true,	"list": 2						},
	{"name": "Small Axe", "price": 100	, "sellable": true, "holdable": true,	"list": 2						},
	{"name": "Axe", 	"price": 200		, "sellable": true, "holdable": true,	"list": 2						},

		# Crops
	{"name": "Apple", 			"price": 5		, "sellable": true, "holdable": false,	"list": 1						},
	{"name": "Banana", 			"price": 10		, "sellable": true, "holdable": false,	"list": 1						},
	{"name": "Orange", 			"price": 10		, "sellable": true, "holdable": false,	"list": 1						},
	{"name": "Tomato", 			"price": 5		, "sellable": true, "holdable": false,	"list": 1						},
	{"name": "Potato", 			"price": 5		, "sellable": true, "holdable": false,	"list": 1						},
	
	{"name": "Watermelon", 		"price": 15		, "sellable": true, "holdable": false,	"list": 1							},
	{"name": "Peach", 			"price": 15		, "sellable": true, "holdable": false,	"list": 1						},
	{"name": "Lemon", 			"price": 10		, "sellable": true, "holdable": false,	"list": 1						},
	{"name": "Lime", 			"price": 15		, "sellable": true, "holdable": false,	"list": 1					},
	{"name": "Kiwi", 			"price": 20		, "sellable": true, "holdable": false,	"list": 1					},
	
	{"name": "Red Grape", 		"price": 30		, "sellable": true, "holdable": false,	"list": 1							},
	{"name": "Green Grape", 	"price": 30		, "sellable": true, "holdable": false,	"list": 1							},
	{"name": "Blueberry", 		"price": 35		, "sellable": true, "holdable": false,	"list": 1							},
	{"name": "Cherry", 			"price": 40		, "sellable": true, "holdable": false,	"list": 1						},
	{"name": "Eggplant", 		"price": 25		, "sellable": true, "holdable": false,	"list": 1						},	

	]
	
var weapons = [
	{"name": "Stick", "att": 15},
	{"name": "Knife", "att": 20},
	{"name": "Small Axe", "att": 30},
	{"name": "Axe", "att": 60}
	
]
var tiers = [
	["Apple", "Banana", "Orange", "Tomato", "Potato"],
	["Watermelon", "Peach", "Lemon", "Lime", "Kiwi"],
	["Red Grape", "Green Grape", "Blueberry", "Cherry", "Eggplant"]
]

var workers = [
	{"Time": 1, "Capacity": 1, "Tier": 1},
	{"Time": 40, "Capacity": 1, "Tier": 1},
	{"Time": 40, "Capacity": 1, "Tier": 1},
	{"Time": 40, "Capacity": 1, "Tier": 1},
	{"Time": 40, "Capacity": 1, "Tier": 1},
	{"Time": 40, "Capacity": 1, "Tier": 1},
	
]

func chest_opened(tier):
	var chest_item = random_chest_item(tier)
	inventory._update_inventory(chest_item, 1)

func random_chest_item(tier):
	var num = randi() % len(tiers[tier-1])
	return tiers[tier-1][num]

#
#func _process(delta: float) -> void:
	#pass
