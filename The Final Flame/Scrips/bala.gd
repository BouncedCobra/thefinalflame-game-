extends Sprite

var dir : Vector2

var apagados
var dif = 1
var bosslife

func _ready():

	apagados = Variablesglobales.apagados
	dif = Variablesglobales.dificultad
	bosslife = Variablesglobales.bosslife


func fire(origin : Vector2, dest : Vector2):
	dir = origin.direction_to(dest)
	

func _process(delta):
	if dir:
		global_position += dir * delta * 1500


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_impacto_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	if(area.get_name()=="Enemy"):
		dif = Variablesglobales.dificultad
		if(dif==1):
			if(get_node("../Timer").wait_time>dif):
				get_node("../Timer").wait_time -= 0.03
				get_node("../Timer2").wait_time -= 0.03
				get_node("../Timer3").wait_time -= 0.03
				get_node("../Timer4").wait_time -= 0.03
				get_node("../Timer5").wait_time -= 0.03
		else:
			if(get_node("../Timer").wait_time>0):
				get_node("../Timer").wait_time -= 0.03
			if(get_node("../Timer2").wait_time>0):
				get_node("../Timer2").wait_time -= 0.03
			if(get_node("../Timer3").wait_time>0):
				get_node("../Timer3").wait_time -= 0.03
			if(get_node("../Timer4").wait_time>0):
				get_node("../Timer4").wait_time -= 0.03
			if(get_node("../Timer5").wait_time>0):
				get_node("../Timer5").wait_time -= 0.03
		
		apagados += 1
		Variablesglobales.apagados = apagados
		if (get_node("../../PROVNode/Player2")):
			get_node("../../PROVNode/Player2/apagado").playing = true
		area.queue_free()
		queue_free()
		
	
	if(area.get_name()=="Boss"):
		bosslife=Variablesglobales.bosslife
		bosslife-=1
		Variablesglobales.bosslife = bosslife
		if (bosslife<1):
			area.queue_free()
		queue_free()
