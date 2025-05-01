extends CharacterBody2D

@onready var animation:AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const ACELERATION = 1500
const FRICTION = 1200

func _ready() -> void:
	animation.flip_h = false

func _physics_process(delta: float) -> void:
	var horizontal = Input.get_axis("ui_left","ui_right")
	var vertical = Input.get_axis("ui_up","ui_down")
	
	var direction = Vector2(horizontal, vertical).normalized()
	
	if direction.x > 0 and direction.y < 0:
		animation.play("TopRight")
		animation.flip_h = false
	elif direction.x > 0 and direction.y == 0:
		animation.play("Right")
		animation.flip_h = false
	elif direction.x > 0 and direction.y > 0:
		animation.play("BottomRight")
		animation.flip_h = false
	elif direction.x == 0 and direction.y > 0:
		animation.play("Bottom")
	elif direction.x == 0 and direction.y < 0:
		animation.play("Top")
	elif direction.x < 0 and direction.y < 0:
		animation.play("TopRight")
		animation.flip_h = true #left
	elif direction.x < 0 and direction.y == 0:
		animation.play("Right")
		animation.flip_h = true #left
	elif direction.x < 0 and direction.y > 0:
		animation.play("BottomRight")
		animation.flip_h = true #left
	
	#velocity = direction * SPEED
	if direction.length() > 0: #length de um vetor2 é a amplitude maxima (positiva)
		velocity = velocity.move_toward(direction * SPEED, ACELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move_and_slide()
