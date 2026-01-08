extends CanvasLayer

@onready var inventory = $"."
@onready var currency_label = $"../currency"

var inventory_opened = 0


var inventory_items = [
	{"name": "Apple", "amount":  7, "price": 7},
	{"name": "Cat", "amount":  1, "price": 100},
	{"name": "Mango", "amount":  4, "price": 10},
	#{"name": "Diamonds", "amount":  64, "price": 99}
	
]


#@export var currency = global.currency

func refresh_currency():
	#print("i'm here")
	#print()
	currency_label.text = str(global.currency) + " $"


func print_test():
	test += 1
	print(test)


var test = 0

func _ready() -> void:
	#print(inventory_items[")
	
	#print(item_exist("apple"))
	#print(item_exist("Apple"))
	
	_update_inventory("Apple", 5)
	_update_inventory("Mango", -4)
	
	
	
	refresh_currency()
	#print(get_path())
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inventory_opened == 2:
		return
	
		
	var inventory_pressed = Input.is_action_just_pressed("inventory")
	#if(inventory_opened == 2): 
		#inventory_pressed = 0
		#return
	#
	if(inventory_pressed):
		#print_test()

		#if(inventory_opened == 2): print("glitch hahahaha")
		#print(inventory_opened)
		
		#if(inventory_opened == 2):
			#print("Im here now 2")
			
		if(inventory_opened == 0):
			#print("Im here now 0")
			
			refresh_inventory(0)
			#inventorymanage.refresh_inventory()
			
			inventory_opened = 1
			inventory.visible = 1
			#print("i got here")
			
		elif(inventory_opened == 1):
			#print("Im here now 1q")
			
			inventory_opened = 0
			inventory.visible = 0
			


func item_exist(name, list):
	for i in range(len(list)):
		if(name == list[i]["name"]):
			return i
	return -1


func _update_inventory(name, amount, sell = 0):
	var inventory_location = item_exist(name, inventory_items)
	var global_location = item_exist(name, inventory_items)
	
	if(inventory_location == -1):
		inventory_items.append(
			{"name": name, 
			"amount": amount, 
			"price": global.items[global_location]["price"]
			})
	else:
		inventory_items[inventory_location]["amount"] += amount
		if(sell):
			global.update_currency(inventory_items[inventory_location]["price"]*abs(amount))
			refresh_currency()
			print(inventory_items[inventory_location]["price"]*abs(amount))
			
		
		if(inventory_items[inventory_location]["amount"] < 1):
			inventory_items.remove_at(inventory_location)
	if(!sell):
		refresh_inventory(0)
	else:
		refresh_inventory(1)
	
#
#func update_inventory(i, case):
	#print(inventory_items[i]["amount"])
	#inventory_items[i]["amount"] -= 1
	#if(case):
		#global.update_currency(inventory_items[i]["price"])
	#refresh_currency()
		#
	#refresh_inventory(1)
	#


func refresh_inventory(case):
	#name1.text = inventory_items[0]["name"]
	#amount1.text = str(inventory_items[0]["amount"])
	
	var safe_inv = 0
	
	
	for child in get_children():
		if child is Label or child is Button:
			child.queue_free()
	
	for i in len(inventory_items):
		
		var name1 = Label.new()
		var amount = Label.new()
			
		var xpos = ((i-safe_inv)*50)+200
		
		add_child(name1)
		add_child(amount)
		name1.position = Vector2(360, xpos)
		amount.position = Vector2(600, xpos)
		name1.text = inventory_items[i]["name"]
		amount.text = str(inventory_items[i]["amount"])
	
		
		if(case):
			var price = Label.new()
			var button = Button.new()
			
			add_child(price)
			add_child(button)
			
			price.position = Vector2(700, xpos)
			button.position = Vector2(800, xpos)
			
			price.text = str(inventory_items[i]["price"])
			button.text = "Sell x1"

			var sell_press = func():
				_update_inventory(inventory_items[i]["name"], -1, 1)

			button.pressed.connect(sell_press)
			
			
			
	
	
	#print("Inventory refreshed")
	#print("Case " + str(case))
	
	

## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	##refresh_inventory(0)
	##x.text = "Hi"
	#pass # Replace with function body.


#func _on_sell_toggled(toggled_on: bool) -> void:
	#if(inventory_opened == 1): return
	#
	#if(toggled_on):
		#inventory.visible = 1
		#inventory_opened = 2
		#print("Opened")
		#refresh_inventory(1)
		#
	#else:
		#inventory.visible = 0
		#inventory_opened = 0
		#print("Closed")
		#
		#
	
func _on_sell_pressed() -> void:
	if(inventory_opened == 1): print("im not glitching")
	
	if(inventory_opened == 0):
		inventory.visible = 1
		inventory_opened = 2
		refresh_inventory(1)
	elif(inventory_opened == 2):
		inventory_opened = 0
		inventory.visible = 0
	
	#print("im not glitching")
	#
