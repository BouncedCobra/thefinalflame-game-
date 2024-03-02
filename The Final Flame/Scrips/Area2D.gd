extends Area2D
var pv1 = 0
var pv2 = 4
var cont = 0
var vidas
var pos
var direccion
var origen

func _ready():
	vidas = Variablesglobales.vidas
	
func _physics_process(delta):
	origen = global_position
	movimiento()
	if (get_node_or_null("../../Player2")):
		global_position += direccion * delta * 500 #movimiento
		

func _on_Enemy_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	
	if (body.get_name()=="Player2"):
		vidas = Variablesglobales.vidas
		vidas -= 1
		pv2 -= 1
		get_node("../../Player2/pv2").text = str("Player 2: ", vidas)
		Variablesglobales.vidas = vidas

		queue_free()
		
	
func movimiento():
	if (get_node_or_null("../../Player2")):
		if (get_node("../../Player2")!=null):
			pos = get_node("../../Player2").posicion
			direccion = origen.direction_to(pos) #calculo de direccion
		else:
			pos = Vector2(0,0)
			direccion = origen.direction_to(pos)
