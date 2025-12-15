extends StaticBody2D

var plant = Global.plant_selected
var plantgrowing = false
var plant_grown = false

func _physics_process(delta: float) -> void:
	if plantgrowing == false:
		plant = Global.plant_selected

func _on_area_2d_area_entered(area: Area2D) -> void:
	if not plantgrowing:
		if plant == 1:
			plantgrowing = true
			$plant.visible = true
			$plant.frame = 0
			$carrot_grow_timer.start()
			$plant.play("carrot")
		elif plant == 2:
			$plant.visible = true
			$plant.frame = 0
			plantgrowing = true
			$cabbage_grow_timer.start()
			$plant.play("cabbage")
	else:
		print("plant is already growing here")

func _on_carrot_grow_timer_timeout() -> void:
	var carrot_plant = $plant
	if carrot_plant.frame == 0:
		carrot_plant.frame = 1
		$carrot_grow_timer.start()
	elif carrot_plant.frame == 1:
		carrot_plant.frame = 2
		plant_grown = true

func _on_cabbage_grow_timer_timeout() -> void:
	var cabbage_plant = $plant
	if cabbage_plant.frame == 0:
		cabbage_plant.frame = 1
		$cabbage_grow_timer.start()
	elif cabbage_plant.frame == 1:
		cabbage_plant.frame = 2
		plant_grown = true

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if plant_grown:
			if plant == 1:
				Global.numofcarrot += 1
				$carrot_grow_timer.stop()
			elif plant == 2:
				Global.numofcabbage += 1
				$cabbage_grow_timer.stop()
			plantgrowing = false
			plant_grown = false
			$plant.visible = false
