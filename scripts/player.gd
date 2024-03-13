extends CharacterBody2D

var speed = 100
var last_direction = Vector2.ZERO

func _ready():
	position = Vector2(279, 168)

func _physics_process(_delta):
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.play("move_right")
		velocity.x = speed
		velocity.y = 0
		last_direction = Vector2.RIGHT
	elif Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.play("move_left")
		velocity.x = -speed
		velocity.y = 0
		last_direction = Vector2.LEFT
	elif Input.is_action_pressed("move_up"):
		$AnimatedSprite2D.play("move_up")
		velocity.y = -speed
		velocity.x = 0
		last_direction = Vector2.UP
	elif Input.is_action_pressed("move_down"):
		$AnimatedSprite2D.play("move_down")
		velocity.y = speed
		velocity.x = 0
		last_direction = Vector2.DOWN
	else:
		if last_direction == Vector2.RIGHT:
			$AnimatedSprite2D.play("idle_right")
		elif last_direction == Vector2.LEFT:
			$AnimatedSprite2D.play("idle_left")
		elif last_direction == Vector2.UP:
			$AnimatedSprite2D.play("idle_back")
		elif last_direction == Vector2.DOWN:
			$AnimatedSprite2D.play("idle_front")
		else:
			$AnimatedSprite2D.play("idle_front")
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
