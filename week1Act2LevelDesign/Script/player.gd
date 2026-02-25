extends CharacterBody2D

const SPEED := 150.0
const DASH := 300.0
const JUMP := -400.0
var dir = 1
var is_dashing := false

@onready var player_anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var is_dashing_timer: Timer = $Timer
@onready var dash_particle: GPUParticles2D = $GPUParticles2D

func _physics_process(delta: float) -> void:
	if is_dashing:
		velocity.x = DASH
		velocity.y = 0
		move_and_slide()
		return
	
	velocity.x = dir * SPEED
	player_anim.play("walk")
	
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = JUMP
		player_anim.play("jump")
	elif velocity.y > 0 && not is_on_floor():
		player_anim.play("fall")
	
	if Input.is_action_just_pressed("dash"):
		is_dashing = true
		is_dashing_timer.start()
		player_anim.play("dash")
		
		# Decide direction of dash cloud animation and play
		var mat := dash_particle.process_material as ParticleProcessMaterial
		if mat:
			mat.direction = Vector3(-1, 0, 0)
		dash_particle.restart()

	
	move_and_slide()

func _on_timer_timeout() -> void:
	is_dashing = false
