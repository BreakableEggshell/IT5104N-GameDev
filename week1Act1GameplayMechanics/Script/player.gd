extends CharacterBody2D

var direction : int
const SPEED : int = 150

@onready var player_sprite: AnimatedSprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	direction = Input.get_axis("move_left", "move_right")
	
	velocity.x = direction * SPEED
	
	if Input.is_action_just_pressed("move_jump") && is_on_floor():
		velocity.y = -400
	
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
	
	if direction > 0:
		player_sprite.flip_h = false
	elif direction < 0:
		player_sprite.flip_h = true
	
	if not is_on_floor() && velocity.y > 0:
		player_sprite.play("fall")
	elif not is_on_floor() && velocity.y < 0:
		player_sprite.play("jump")
	elif direction != 0:
		player_sprite.play("walk")
	else:
		player_sprite.play("idle")
	
	move_and_slide()
