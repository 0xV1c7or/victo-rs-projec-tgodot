extends CharacterBody2D

var velocidade = Vector2(0,0)

func _physics_process(delta: float) -> void:
	velocidade.x = 0

	if Input.is_key_pressed(KEY_D):
		velocidade.x = 300
		$imagem.flip_h = false

	elif Input.is_key_pressed(KEY_A):
		velocidade.x = -300
		$imagem.flip_h = true

	move_and_collide(velocidade * delta)
