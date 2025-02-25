extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	 for button in get_tree().get_nodes_in_group("button"):
		button.connect("mouse_exited",self,"mause_interaçao",[button,"exited"])
		button.connect("mouse_entered",self,"mause_interaçao",[button,"entered"])



# Called every frame. 'delta' is the elapsed time since the previous frame.
func mause_iteraçao(Button:button,String:state) -> void:
	match state:
		"exited":
			button.scale = Vector2(1.2,1.2)
			button.modulate.a = 0.5
		"entered":
			button.scale = Vector2(1.2,1.2)
			button.modulate.a = 1.0
	
	  
