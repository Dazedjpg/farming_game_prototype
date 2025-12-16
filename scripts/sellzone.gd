extends StaticBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player_sell_method"):
		var carrots = Global.numofcarrot
		var cabbage = Global.numofcabbage
		var berry = Global.numofberry
		var coins = Global.coins
		
		coins += carrots * 5
		coins += cabbage * 8
		coins += berry * 3
		
		carrots = 0
		cabbage = 0
		berry = 0
		
		Global.coins = coins
		Global.numofcarrot = carrots
		Global.numofcabbage = cabbage
		Global.numofberry = berry
