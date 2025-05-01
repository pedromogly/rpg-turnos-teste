extends CharacterBody2D

enum State {
	IDLE,
	WALK
}


@onready var animations: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	
	
	move_and_slide()
		
