extends Node2D

func _physics_process(delta: float) -> void:
	$carrottext.text = ("= " + str(Global.numofcarrot))
	$cabbagetext.text = ("= " + str(Global.numofcabbage))
	$cointext.text = ("= " + str(Global.coins))
