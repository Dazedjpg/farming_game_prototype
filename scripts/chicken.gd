extends CharacterBody2D

var eating = false
var walking = false

var xdir = 1
var ydir = 1
var speed = 30
var direction = Vector2()
var moving_vertical_horizontal = 1

func _ready() -> void:
	walking = true
	randomize()

func _physics_process(delta: float) -> void:
	var waittime = 1
	if walking == false:
		var x = randi_range(1, 2)
		if x > 1.5:
			moving_vertical_horizontal = 1
		else:
			moving_vertical_horizontal = 2
	
	if walking == true:
		$AnimatedSprite2D.play("walking")
		if moving_vertical_horizontal == 1:
			if xdir == -1:
				$AnimatedSprite2D.flip_h = true
			elif xdir == 1:
				$AnimatedSprite2D.flip_h = false
			velocity.x = speed * xdir
			velocity.y = 0
		elif moving_vertical_horizontal == 2:
			velocity.y = speed * ydir
			velocity.x = 0
	
	if eating == true:
		$AnimatedSprite2D.play("eating")
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func _on_changestatetimer_timeout() -> void:
	var waittime = 1
	if walking == true:
		eating = true
		walking = false
		waittime = randi_range(1, 5)
	elif eating == true:
		walking = true
		eating = false
		waittime = randi_range(2, 6)
	$changestatetimer.wait_time = waittime
	$changestatetimer.start()


func _on_walktimer_timeout() -> void:
	var x = randi_range(1, 2)
	var y = randi_range(1, 2)
	var waittime = randi_range(1, 4)
	if x > 1.5:
		xdir = 1
	else:
		xdir = -1
	if y > 1.5:
		ydir = 1
	else:
		ydir = -1
	$changestatetimer.wait_time = waittime
	$walktimer.start()
