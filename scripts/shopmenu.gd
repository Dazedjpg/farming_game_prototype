extends StaticBody2D

var item = 1
var item1price = 100
var item2price = 150
var item1owned = false
var item2owned = false
var price
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$icon.play("berryseed")
	item = 1

func _physics_process(delta: float) -> void:
	if self.visible == true:
		if item == 1:
			$icon.play("berryseed")
			$pricelabel.text = "100"
		elif item == 2:
			$icon.play("randomseed")
			$pricelabel.text = "150"

func _on_button_left_pressed() -> void:
	swap_item_back()

func _on_button_right_pressed() -> void:
	swap_item_forward()

func _on_buybutton_pressed() -> void:
	if item == 1:
		price = item1price
		if Global.coins >= price:
			if item1owned == false:
				buy()
	elif item == 2:
		price = item2price
		if Global.coins >= price:
			if item2owned == false:
				buy()

func swap_item_back():
	if item == 1:
		item = 2
	elif item == 2:
		item = 1

func swap_item_forward():
	if item == 1:
		item = 2
	elif item == 2:
		item = 1

func buy():
	Global.coins -= price
	if item == 1:
		item1owned = true
	elif item == 2:
		item2owned = true
