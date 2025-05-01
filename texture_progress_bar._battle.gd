extends TextureProgressBar

var speed: float = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = 0
	max_value = 100

func _physics_process(delta: float) -> void:
	value += speed * delta
	print(value)
	if value >= max_value:
		value = 0
