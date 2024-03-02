extends Node2D

var enemigo = preload("res://Scenes/Fuego.tscn") # cargar enemigo
var dest_bullet_rec = preload("res://Scenes/bala.tscn")
var boss = preload("res://Scenes/boss.tscn")
var pos = Vector2(0,0)
var enemy_inst 
var enemy_inst2 
var boss_inst
var count = 0
var velocity
var direccion
var origen
var vidas=4
var apagados = 0
var tiempo
var bosslife = 25
var en = 0

func _init():
	Variablesglobales.apagados = apagados
	OS.window_maximized = true

func _ready():
	Variablesglobales.dificultad = 1
	Variablesglobales.bosslife = 25
	$Fondo.volume_db = Variablesglobales.vol
	$Player2/apagado.volume_db = Variablesglobales.vol
	$Player2/bala.volume_db = Variablesglobales.vol
	$Muerte.volume_db = Variablesglobales.vol

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
	bosslife = Variablesglobales.bosslife
	ver()
	
 
func ver():
	if (vidas < 1):
		$Fondo.playing = false
		if ($Muerte.playing == false):
			$Muerte.play()
		$GO.visible = true
		$puntaje.visible = true
		$retry.visible = true
		$Menu.visible =  true
		$puntaje.text = "Puntaje: "+ String(apagados)
	
	if(vidas>1):
		if (apagados > 49):
			if(bosslife>1):
				$Player2/barboss.value=bosslife
				$Player2/barboss.visible=true
			
			if(en==0):
				en=1
				boss_inst = boss.instance()
				boss_inst.global_position = pos + Vector2(0,-500)
				add_child(boss_inst)
				boss_inst.owner=self
			
			if(bosslife<1):
				if($Player2):
					$Player2/barboss.visible=false
					$Player2.queue_free()
				$YouWin.visible = true
				$retry.visible = true
				$Menu.visible =  true
		
	
	
func crear_enemigo():
	enemy_inst = enemigo.instance() #Crear configuracion enemigo
	enemy_inst.global_position = pos + Vector2(-1000,-1000)
	add_child(enemy_inst) # especificamente este es el que lo crea
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
	if (get_node_or_null("Player2")): #timer para que con el tiempo aparecen
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


func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")


func _on_retry_pressed():
	get_tree().reload_current_scene()
	
func apagar():
	pass
