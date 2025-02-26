extends Camera3d

# Variáveis para controle do raycast e da interação
var ray_length : float = 1000 # Distância do raycast
var cursor_position : Vector2

# Variável para referência ao botão
var button : Button

func _ready():
	# Referência ao botão 2D que está no CanvasLayer
	button = get_node("/root/Node/CanvasLayer/Button")

func _process(delta):
	# Obter a posição do mouse na tela (2D)
	cursor_position = get_viewport().get_mouse_position()

	# Realizar o Raycast da câmera para o espaço 3D
	var from = global_transform.origin
	var to = project_ray_origin(cursor_position) + project_ray_normal(cursor_position) * ray_length

	# Criação do Raycast
	var space_state = get_world().direct_space_access
	var result = space_state.intersect_ray(from, to, [], 1)

	if result:
		var collider = result["collider"]
		# Verifique se o collider é o plano ou outro objeto 3D
		if collider and collider.is_in_group("interactive"):
			# Verifica se o usuário clicou (pressionou a tecla)
			if Input.is_action_just_pressed("ui_accept"):
				print("Interação com o objeto 3D detectada!")

	# Verificar se o cursor 2D colidiu com o botão 2D
	if button.get_rect().has_point(cursor_position):
		if Input.is_action_just_pressed("ui_accept"):
			button.pressed = true  # Simula o clique no botão
			print("Botão 2D foi pressionado!")
