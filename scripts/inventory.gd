extends CanvasLayer

@onready var inventory = $"."
@onready var currency_label = $"../currency"

var inventory_opened = 0


var inventory_items = [
	#{"name": "Apple", "amount":  7},
	#{"name": "Tomato", "amount":  7},
	#{"name": "Potato", "amount":  7},
	#{"name": "Banana", "amount":  7},
	#{"name": "Orange", "amount":  7},
	
	
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
	global.inventory = self
	#print(inventory_items[")
	
	#print(item_exist("apple"))
	#print(item_exist("Apple"))
	
	#_update_inventory("Apple", 5)
	#_update_inventory("Mango", -4)
	
	
	
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
			


func item_exist(_name, list):
	for i in range(len(list)):
		if(_name == list[i]["name"]):
			return i
	return -1


func _update_inventory(_name, amount, sell = 0):
	var inventory_location = item_exist(_name, inventory_items)
	var global_location = item_exist(_name, inventory_items)
	
	if(inventory_location == -1):
		inventory_items.append(
			{"name": _name, 
			"amount": amount, 
			"price": global.items[global_location]["price"]
			})
	else:
		inventory_items[inventory_location]["amount"] += amount
		if(sell):
			global.update_currency(inventory_items[inventory_location]["price"]*abs(amount))
			refresh_currency()
			#print(inventory_items[inventory_location]["price"]*abs(amount))
			
		
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

var item_order

func refresh_inventory(case):
	#name1.text = inventory_items[0]["name"]
	#amount1.text = str(inventory_items[0]["amount"])
	#print("New lap")
	
	#var safe_inv = 0
	
	
	var row = 0
	
	
	# Shop #
	var button = TextureButton.new()
	var all = TextureButton.new()
	var amount_input = SpinBox.new()
	var button_text = Label.new()
	var all_text = Label.new()
	
	
	###
	
	for child in get_children():
		if child is Label or child is Button or child is SpinBox or child is TextureButton:
			child.queue_free()
	
	var item_name = Label.new()
	var item_price = Label.new()
	
	
	add_child(item_name)
	item_name.text = "Item"
	item_name.position = Vector2(870,200)
	
	add_child(item_price)
	item_price.text = "0$"
	item_price.position = Vector2(870,250)
	
	
	for i in len(inventory_items):
		#print("row: " + str(row))
		#if i >= lenas(inventory_items): return
		
		
		
		var xpos = (row*100)+300
		var ypos = ((i-(4*row))*100)+180
		
		var icon = TextureButton.new()
		icon.texture_normal = load("res://assets/items/%s.png" % inventory_items[i]["name"])
		
		add_child(icon)
		
		icon.position = Vector2(xpos, ypos)
		icon.size = Vector2(64,64)
		
		icon.ignore_texture_size = true
		icon.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		#var name1 = Label.new()
		#add_child(name1)
		#name1.position = Vector2(360, ypos)
		#name1.text = inventory_items[i]["name"]
		
		icon.scale = Vector2.ONE
		
		var amount = Label.new()
		add_child(amount)
		amount.position = Vector2(xpos+64, ypos+40)
		amount.text = str(int(inventory_items[i]["amount"]))
		
		icon.pressed.connect(func():
			item_name.text = inventory_items[i]["name"]
			item_price.text = str(inventory_items[i]["price"]) + "$"
			item_order = i
			print(item_order)
			
			all.disabled = 0
			amount_input.editable = 1
			button.disabled = 0
			amount_input.max_value = inventory_items[item_order]["amount"]
		)
		
		icon.mouse_entered.connect(func():
			icon.create_tween().tween_property(
				icon, "scale", Vector2(1.15, 1.15), 0.12
			)
		)

		icon.mouse_exited.connect(func():
			icon.create_tween().tween_property(
				icon, "scale", Vector2.ONE, 0.12
			)
		)
		
		if (i % 4 == 3):
			#print("i " + str(i))
			row +=1 
	
		#
		#if(case):
			#var price = Label.new()
			#var button = Button.new()
			#var all = Button.new()
#
			#var amount_input = SpinBox.new()
			#
			#add_child(price)
			#add_child(button)
			#add_child(all)
			#add_child(amount_input)
			#
			#price.position = Vector2(550, ypos)
			#amount_input.position = Vector2(600, ypos)
			#all.position = Vector2(700, ypos)
			#button.position = Vector2(750, ypos)
			#
			#amount_input.min_value = 1
			#amount_input.max_value = inventory_items[i]["amount"]
			#
			#price.text = str(inventory_items[i]["price"])
			#all.text = "All"
			#button.text = "Sell"
#
			#var sell_press = func():
				#_update_inventory(inventory_items[i]["name"], -amount_input.value, 1)
#
			#var select_all = func():
				#amount_input.value = amount_input.max_value
			#
			#button.pressed.connect(sell_press)
			#all.pressed.connect(select_all)
	if(case):
		
		button.disabled = 1
		all.disabled = 1
		amount_input.editable = 0
		#
		#all.text = "All"
		#button.text = "Sell"
		#
		add_child(button)
		add_child(all)
		add_child(amount_input)
		add_child(button_text)
		add_child(all_text)
		
		button_text.text = "Sell"
		all_text.text = "All"
		
		button.texture_normal = global.button_normal
		button.texture_hover = global.button_hover
		button.texture_disabled = global.button_disabled
		button.texture_pressed = global.button_pressed
		
		all.texture_normal = global.button_normal
		all.texture_hover = global.button_hover
		all.texture_disabled = global.button_disabled
		all.texture_pressed = global.button_pressed
				
		
		var tp1 = 300
		var tp2 = 350
		
		
		button.scale = Vector2(3.5,3.5)
		all.scale = Vector2(3.5,3.5)
		
		button.position = Vector2(870,300)
		all.position = Vector2(870,350)
		
		button_text.position = Vector2(883,tp1)
		all_text.position = Vector2(885,tp2)
		
		button_text.add_theme_font_override("font", global.font1)
		all_text.add_theme_font_override("font", global.font1)
		
		
		
		amount_input.position = Vector2(870,400)
		
		
		
		amount_input.min_value = 1
		amount_input.max_value = 15
		#amount_input.max_value = inventory_items[item_order]["amount"]
		
		
		var sell_press = func():
			_update_inventory(inventory_items[item_order]["name"], -amount_input.value, 1)
			
			#print(inventory_items)
			#print(item_order)
			#print(inventory_items[item_order])
			#print(inventory_items[item_order]["name"])
			#
			#print(amount_input.value)

		
		var select_all = func():
			amount_input.value = amount_input.max_value
			#
		button.pressed.connect(sell_press)
		all.pressed.connect(select_all)
		
		#var text_down = func():
			#var _temp = tex.position.y
			#tex.position.y = _temp - 20
			#
			#
		
		#button.button_up.connect(text_down)
		#all.button_up.connect(text_down)
		
		
		all.button_up.connect(func():
			#all_text.text = "Hello1"
			
			all_text.position.y = tp2
			print(all_text.position.y)

		)
		
		all.button_down.connect(func():
			#all_text.text = "Hello2"
			all_text.position.y = tp2+2 
			print(all_text.position.y)
			
		)
	
		
		button.button_up.connect(func():
			#button_text.text = "Hello1"
			
			button_text.position.y = tp1
			print(button_text.position.y)

		)
		
		button.button_down.connect(func():
			#button_text.text = "Hello2"
			button_text.position.y = tp1+2 
			print(button_text.position.y)
			
		)
	
	
	
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
	#if(inventory_opened == 1): print("im not glitching")
	
	if(inventory_opened == 0):
		inventory.visible = 1
		inventory_opened = 2
		refresh_inventory(1)
	elif(inventory_opened == 2):
		inventory_opened = 0
		inventory.visible = 0
	
	#print("im not glitching")
	#
