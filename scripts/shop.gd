extends StaticBody2D

func _ready() -> void:
	$shopmenu.visible = false

func _process(delta: float) -> void:
	if Global.weather == "rain":
		$AnimatedSprite2D2.visible = false
	elif Global.weather == "none":
		$AnimatedSprite2D2.visible = true
	if $shopmenu.item1owned == true:
		$berry_seedpack.visible = true
	elif $shopmenu.item2owned == true:
		print("random seed pack")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player_shop_method"):
		$shopmenu.visible = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	$shopmenu.visible = false
