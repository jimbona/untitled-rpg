extends CharacterBody2D

@export var move_speed : float = 85
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(_delta):
	
	var animation_to_play = ""
	
	if Input.is_action_pressed("move_right"):
		animation_to_play = "walk_right"
		velocity.x = move_speed
	elif Input.is_action_pressed("move_left"):
		animation_to_play = "walk_left"
		velocity.x = -move_speed
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("move_down"):
		animation_to_play = "walk_down"
		velocity.y = move_speed
	elif Input.is_action_pressed("move_up"):
		animation_to_play = "walk_up"
		velocity.y = -move_speed
	else:
		velocity.y = 0
	
	if velocity.length() > 10:
		animated_sprite.play(animation_to_play)
	else:
		match animated_sprite.animation:
			"walk_right", "idle_right":
				animated_sprite.play("idle_right")
			"walk_left", "idle_left":
				animated_sprite.play("idle_left")
			"walk_up", "idle_up":
				animated_sprite.play("idle_up")
			"walk_down", "idle_down":
				animated_sprite.play("idle_down")
	
	move_and_slide()
