extends KinematicBody2D


var motion = Vector2(0,0)
var velocidad = 24000
var runvel = 40000
var speed = 0
var timer
var count = 0
var posicion = Vector2(0,0)
var vidas = 4
var apagados
var pos

onready var sprite_anim = $Player2a

func _ready():
	Variablesglobales.vidas = vidas
	vidas = Variablesglobales.vidas
	$pv2.text = str("Player 2: ", vidas)
	$damage.volume_db = Variablesglobales.vol
	
func _physics_process(delta):
	Movement(delta)
	
	vidas = Variablesglobales.vidas
	apagados = Variablesglobales.apagados
	$collect2.text = str(apagados)
	
		

	
func Movement(delta):
	motion=Vector2(0,0)
	pos = get_global_mouse_position().x - global_transform.origin.x
	if (get_global_mouse_position().x<global_transform.origin.x):
		$Player2a.flip_h = true
	else:
		$Player2a.flip_h = false
	if Input.is_action_pressed("move_right"):
		motion.x=100
		if (pos < 0):
			sprite_anim.set_deferred("animation", "Iwalk")
		else:
			sprite_anim.set_deferred("animation", "Walk")
		
		count=0
		posicion = global_transform.origin
		
	

	elif Input.is_action_pressed("move_left"):
		motion.x=100*(-1)
		if (pos > 0):
			sprite_anim.set_deferred("animation", "Iwalk")
		else:
			sprite_anim.set_deferred("animation", "Walk")
		
		count=0
		posicion = global_transform.origin
		
	else:
		count+=1
		if (count <= 500):
			sprite_anim.set_deferred("animation", "Idle")
			posicion = global_transform.origin
			
		
	
	motion.y=100
	motion= motion.normalized()
	
	if Input.is_action_pressed("Run"):
		speed=runvel
	else:
		speed=velocidad
	motion = move_and_slide(motion*speed*delta)
	

func _on_PlayerArea_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	if (is_instance_valid($Player2a)):
		if(area.get_name()=="Enemy"):
			$damage.playing = true
			$Player2a.modulate=Color8(255,0,0,255)
			yield(get_tree().create_timer(0.1), "timeout")
			$Player2a.modulate=Color8(255,255,255,255)
	if(vidas<1):
		queue_free()
	
