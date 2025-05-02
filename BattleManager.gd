extends Node2D

@export var labelTurnInfo: Label
@export var labelSeconds: Label
@export var progressRound: TextureProgressBar

var waitTimeDefault = 30
var speedEnemy
var speedPlayer

var timer = Timer.new()

func _init():
	add_child(timer)

func _ready() -> void:
	progressRound.value = 0.0
	progressRound.max_value = 100.0
	timer.start(12.0)
	timer.paused = true
	timer.connect("timeout",_on_timer_timeout)

func _physics_process(delta: float) -> void:
	player_waiting(delta)
	labelSeconds.text = String.num(timer.time_left, 0)

func player_waiting(delta: float):
	progressRound.max_value = 500
	progressRound.value += waitTimeDefault * delta
	if progressRound.value >= progressRound.max_value:
		progressRound.value = 500.0
		timer.paused = false

func _on_timer_timeout():
	progressRound.value = 0.0
	timer.paused = true
