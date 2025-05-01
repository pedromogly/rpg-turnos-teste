extends Sprite2D

var max_health = 74
var attack_base = 35
static var speed = 12

@export var progressBar: TextureProgressBar
@export var uiBattle: Control

func _ready():
	pass

func _physics_process(delta: float) -> void:
	if progressBar.value == 100.0:
		isMyTurn()
	else:
		uiBattle.visible = false
	
func isMyTurn ():
	uiBattle.visible = true
