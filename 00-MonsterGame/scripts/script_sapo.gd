extends KinematicBody2D

var velocidade = 300
var direcao = Vector2.ZERO

var moedas

func _ready():
	moedas = get_node("../Moedas").get_child_count()

func _process(delta):
	direcao.x = Input.get_axis("ui_left","ui_right")
	direcao.y = Input.get_axis("ui_up","ui_down")
	direcao *= velocidade
	
	if (moedas==0):
		get_tree().change_scene("res://fases/Fase2.tscn")
	
	move_and_slide(direcao)
