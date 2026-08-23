extends CharacterBody2D

const SPEED = 300.0

func _physics_process(_delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	move_and_slide()
	
	# --- NOVA PARTE: Controlando a inclinação da nave ---
	
	# Para garantir que a animação não fique tocando sozinha em loop
	$ImagemPlayer.stop()
	
	# No Godot, o Y negativo (-1) significa ir para CIMA
	if direction.y < 0:
		$ImagemPlayer.frame = 6
		
	# O Y positivo (1) significa ir para BAIXO
	elif direction.y > 0:
		$ImagemPlayer.frame = 0
		
	# Se não estiver indo nem para cima nem para baixo (parada ou só pros lados)
	else:
		$ImagemPlayer.frame = 3 # O quadro do meio, com a nave retinha
