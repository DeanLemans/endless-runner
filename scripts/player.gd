extends CharacterBody2D

const GRAVITY : int = 4200
const JUMP_POWER : int = -1800

#func _physics_process(delta):
	#if not is_on_floor():
		#velocity.y += GRAVITY * delta
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = JUMP_POWER
		
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if is_on_floor() and Input.is_action_pressed("jump"):
				velocity.y = JUMP_POWER
				
	move_and_slide()
