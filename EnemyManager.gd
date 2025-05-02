extends Sprite2D

var max_health = 55
var current_health = max_health
var attack = 31
var dextery = 90
var speed = 10

@export var progressBarHealth: TextureProgressBar
@export var animations: AnimationPlayer
@export var displayInfos: Label
@export var player: Sprite2D
@export var labelProgressBar: Label

signal sendMySpeed(speed)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.bater.connect(take_damage)
	progressBarHealth.max_value = max_health
	progressBarHealth.value = current_health
	emit_signal("sendMySpeed", speed)
	
	labelProgressBar.text = String.num(max_health,0)+"/"+String.num(current_health,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func take_damage(dano):
	print(dano)
	current_health -= dano
	displayInfos.text = String.num(dano,0)
	animations.play("UP_Text")
	progressBarHealth.value = current_health
