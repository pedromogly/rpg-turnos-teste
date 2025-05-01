extends Sprite2D

var max_health = 55
var current_health = max_health
var attack = 31
var dextery = 90
var speed = 10

signal sendMySpeed(speed)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	emit_signal("sendMySpeed", speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
