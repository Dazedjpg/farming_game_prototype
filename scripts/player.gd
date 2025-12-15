extends CharacterBody2D

var speed = 150
var direction = Vector2.ZERO

func _ready() -> void:
	position = Vector2(270, 350)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		$AnimatedSprite2D.play("sidewalk")
		$AnimatedSprite2D.flip_h = true
		direction.x = speed
		direction.y = 0
	elif Input.is_action_pressed("left"):
		$AnimatedSprite2D.play("sidewalk")
		$AnimatedSprite2D.flip_h = false
		direction.x = -speed
		direction.y = 0
	elif Input.is_action_pressed("down"):
		$AnimatedSprite2D.play("frontwalk")
		direction.y = speed
		direction.x = 0
	elif Input.is_action_pressed("up"):
		$AnimatedSprite2D.play("backwalk")
		direction.y = -speed
		direction.x = 0
	else:
		$AnimatedSprite2D.play("idle")
		direction.x = 0
		direction.y = 0
	velocity = direction.normalized() * speed
	move_and_slide()
