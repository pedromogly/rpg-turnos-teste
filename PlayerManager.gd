extends Sprite2D

var max_health = 74
var attack_base = 22
static var speed = 12

signal bater(dano)
signal finalizarTurn

@export var battleManagement: Node2D
@export var progressBar: TextureProgressBar
@export var uiBattle: Control
@export var attackButton: Button
@export var esquivaButton: Button

func _ready():
	pass

func _physics_process(delta: float) -> void:
	if battleManagement.playerTurn:
		isMyTurn()
	else:
		uiBattle.visible = false
	
func isMyTurn ():
	uiBattle.visible = true

func _on_attack_button_up() -> void:
	atacar(attack_base)
	finalizarTurn.emit()

func atacar(dano):
	bater.emit(dano)
	progressBar.value == 0
	
