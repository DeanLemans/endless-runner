extends CharacterBody2D

const GRAVITY : int = 4200
const JUMP_POWER : int = -1800

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if is_on_floor() and Input.is_action_pressed("jump"):
				velocity.y = JUMP_POWER
	move_and_slide()
