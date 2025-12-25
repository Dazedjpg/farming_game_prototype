extends StaticBody2D


var current_weather = "none"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if current_weather == "none":
		$rain.visible = false
		$raincolor.visible = false
	elif current_weather == "rain":
		$rain.visible = true
		$raincolor.visible = true

func _on_timer_timeout() -> void:
	if current_weather == "none":
		current_weather = "rain"
		$Timer.wait_time = randi_range(60, 80)
		$Timer.start()
	elif current_weather == "rain":
		current_weather = "none"
		$Timer.wait_time = randi_range(60, 120)
		$Timer.start()

func _process(delta: float) -> void:
	Global.weather = current_weather
	if current_weather == "none":
		$rain.visible = false
		$raincolor.visible = false
	elif current_weather == "rain":
		$rain.visible = true
		$raincolor.visible = true
