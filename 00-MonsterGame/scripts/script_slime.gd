extends KinematicBody2D

var velocidade = 100
var direcao = Vector2.ZERO
var alvo = Position2D
export var cor = "VERMELHO"

func _ready():
	match cor:
		"AMARELO":
			$Sprite.texture = load("res://sprites/slimes/62_minion_4_xx.png")
		"VERMELHO":
			$Sprite.texture = load("res://sprites/slimes/62_minion_3_xx.png")
		"VERDE":
			$Sprite.texture = load("res://sprites/slimes/62_minion_1_xx.png")
		"AZUL":
			$Sprite.texture = load("res://sprites/slimes/62_minion_2_xx.png")
		

func _process(delta):
	alvo = get_node("../Jogador").position
	
	match cor:
		"AMARELO":
			alvo.y -= 128
		"VERMELHO":
			alvo.y += 128
		"VERDE":
			alvo.x -= 128
		"AZUL":
			alvo.x += 128
	
	direcao = position.direction_to(alvo) * velocidade
	move_and_slide(direcao)


func _on_Area2D_body_entered(body):
	if (body.name=="Jogador"):
		get_tree().reload_current_scene()
