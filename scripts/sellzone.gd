extends StaticBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player_sell_method"):
		var carrots = Global.numofcarrot
		var cabbage = Global.numofcabbage
		var coins = Global.coins
		
		coins += carrots * 5
		coins += cabbage * 5
		
		carrots = 0
		cabbage = 0
		
		Global.coins = coins
		Global.numofcarrot = carrots
		Global.numofcabbage = cabbage
