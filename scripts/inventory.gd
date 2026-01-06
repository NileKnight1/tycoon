extends CanvasLayer
@onready var inventory = $"."

@onready var name1 = $item/name
@onready var count1 = $item/count


func refresh_inventory():
	#name1.text = inventory_items[0]["name"]
	#count1.text = str(inventory_items[0]["count"])
	
	for child in get_children():
		if child is Label:
			child.queue_free()
	
	for i in len(inventory_items):
		var name = Label.new()
		var count = Label.new()
		
		add_child(name)
		add_child(count)
	
		name.position = Vector2(360, (i*50)+200)
		count.position = Vector2(600, (i*50)+200)

		name.text = inventory_items[i]["name"]
		count.text = str(inventory_items[i]["count"])
		
	
	
	print("Inventory refreshed")
	
	

var inventory_opened = 0


var inventory_items = [
	{"name": "Apple", "count":  7},
	{"name": "Cat", "count":  1},
	{"name": "Mango", "count":  4},
	{"name": "Diamonds", "count":  64},
	
]
#

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	refresh_inventory()
	#x.text = "Hi"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var inventory_pressed = Input.is_action_just_pressed("inventory")
	
	if(inventory_pressed):
		if(!inventory_opened):
			#inventorymanage.refresh_inventory()
			refresh_inventory()
			
			inventory_opened = 1
			inventory.visible = 1
			
		elif(inventory_opened):
			inventory_opened = 0
			inventory.visible = 0
	
	pass
	
