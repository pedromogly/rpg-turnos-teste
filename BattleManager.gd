extends Node2D

@export var labelTurnInfo: Label
@export var labelSeconds: Label
@export var progressRound: TextureProgressBar

@export var enemy:Sprite2D
@export var player:Sprite2D

var waitTimeDefault = 30
var speedEnemy
var speedPlayer

var timer = Timer.new()
@onready var playerTurn: bool = false

func _init():
	add_child(timer)

func _ready() -> void:
	#variaveis de inicialização para ser acessadas em outros scripts
	
	#início da coisa toda
	progressRound.value = 0.0
	progressRound.max_value = 500.0
	timer.start(12.0)
	timer.paused = true
	timer.connect("timeout",_on_timer_timeout)
	player.connect("finalizarTurn",_on_timer_timeout)
	

func _physics_process(delta: float) -> void:
	if not playerTurn:
		player_waiting(delta)
		labelTurnInfo.text = "Aguarde seu turno"
		labelSeconds.text = ""
		return
	
	labelTurnInfo.text = "Seu turno! Tempo restante:"
	labelSeconds.text = String.num(timer.time_left, 0)

func player_waiting(delta: float):
	progressRound.value += waitTimeDefault * delta
	if progressRound.value >= progressRound.max_value:
		timer.paused = false
		playerTurn = true

func _on_timer_timeout():
	playerTurn = false
	timer.start(12.0)
	timer.paused = true
	progressRound.value = 0
	

func win_battle(healthOponent):
	if healthOponent <= 0:
		print("TU GANHOU PARABENS OTARIO")
func lose_battle(healthPlayer):
	if healthPlayer <= 0:
		print("TU PERDEU, OTARIO")
