extends AnimatedSprite

func _on_Area2D_body_entered(body):
	if (body.name == "Jogador"):
		body.moedas -= 1
		queue_free()
