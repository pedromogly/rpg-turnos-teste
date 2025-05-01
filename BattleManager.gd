extends Node2D

@export var labelTurnInfo: Label
var turnSeconds
@export var labelSeconds: Label
@export var progressRound: TextureProgressBar

var waitTimeDefault = 20.0
var speedEnemy
var speedPlayer

func _init():
	turnSeconds = 12

func _ready() -> void:
	progressRound.value = 0.0
	progressRound.max_value = 100.0
	var timer = Timer.new()
	timer.wait_time = 1.0
	timer.autostart = true
	timer.connect("timeout",_on_timer_timeout)
	add_child(timer)
	
func _physics_process(delta: float) -> void:
	player_waiting(delta)

func _on_timer_timeout():
	turnSeconds -= 1
	labelSeconds.text = turnSeconds.to_string()

func player_waiting(delta: float):
	progressRound.value += waitTimeDefault * delta
	print(progressRound.value)
	if progressRound.value >= progressRound.max_value:
		progressRound.value = 100.0
		if turnSeconds <= 0:
			progressRound.value = 0.0
		
	
	
	
