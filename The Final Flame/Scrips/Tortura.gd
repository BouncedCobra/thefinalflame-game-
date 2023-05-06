extends Node2D

var enemigo = preload("res://Scenes/Fuego.tscn")
var dest_bullet_rec = preload("res://Scenes/bala.tscn")
var pos = Vector2(0,0)
var enemy_inst 
var enemy_inst2 
var count = 0
var velocity
var direccion
var origen
var vidas = 4
var apagados = 0
var tiempo
var dif

func _init():
	Variablesglobales.apagados = apagados
	dif=0
	Variablesglobales.dificultad = dif
	OS.window_maximized = true
	
func _ready():
	dif = 0
	$Musica.volume_db = Variablesglobales.vol
	$Player2/apagado.volume_db = Variablesglobales.vol
	$Player2/bala.volume_db = Variablesglobales.vol

func _input(event):
	if (get_node_or_null("Player2")):
		pos = get_node_or_null("Player2").posicion
		if event.is_action_pressed("click"):
			var dest_bullet_inst = dest_bullet_rec.instance()
			dest_bullet_inst.fire(pos, get_global_mouse_position())
			dest_bullet_inst.global_position = pos
			add_child(dest_bullet_inst)
			dest_bullet_inst.owner = self
			$Player2/bala.playing =true
		
	

func _physics_process(delta):

	vidas = Variablesglobales.vidas
	apagados = Variablesglobales.apagados
	ver()
	
 
func ver():
	if (vidas < 1):
		
		$GO.visible = true
		$puntaje.visible = true
		$Retry.visible = true
		$Menu.visible =  true
		$puntaje.text = "Puntaje: "+ String(apagados)
		
		
	
	
	
func crear_enemigo():
	enemy_inst = enemigo.instance()
	enemy_inst.global_position = pos + Vector2(-1000,-1000)
	add_child(enemy_inst)
	enemy_inst.owner = self
	
func crear_enemigo2():
	enemy_inst2 = enemigo.instance()
	enemy_inst2.global_position = pos + Vector2(0,-1000)
	add_child(enemy_inst2)
	enemy_inst2.owner = self
	
func crear_enemigo3():
	enemy_inst2 = enemigo.instance()
	enemy_inst2.global_position = pos + Vector2(1000,-1000)
	add_child(enemy_inst2)
	enemy_inst2.owner = self
	
func crear_enemigo4():
	enemy_inst2 = enemigo.instance()
	enemy_inst2.global_position = pos + Vector2(1000,0)
	add_child(enemy_inst2)
	enemy_inst2.owner = self
	
func crear_enemigo5():
	enemy_inst2 = enemigo.instance()
	enemy_inst2.global_position = pos + Vector2(-1000,0)
	add_child(enemy_inst2)
	enemy_inst2.owner = self

func _on_Timer_timeout():
	if (get_node_or_null("Player2")):
		crear_enemigo()


func _on_Timer2_timeout():
	if (get_node_or_null("Player2")):
		crear_enemigo3()


func _on_Timer3_timeout():
	if (get_node_or_null("Player2")):
		crear_enemigo2()


func _on_Timer5_timeout():
	if (get_node_or_null("Player2")):
		crear_enemigo4()


func _on_Timer4_timeout():
	if (get_node_or_null("Player2")):
		crear_enemigo5()


func _on_Retry_pressed():
	get_tree().reload_current_scene()


func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
