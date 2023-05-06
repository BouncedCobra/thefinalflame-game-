extends KinematicBody2D


var motion = Vector2()
var velocidad = 4000
var runvel = 10000
var speed = 0

onready var sprite_anim = $Fireman


func _physics_process(delta):
	Movement(delta)
	look_at_mause()
	
func Movement(delta):
	motion=Vector2(0,0)
	
	if Input.is_action_pressed("move_right"):
		motion.x=100
		sprite_anim.set_deferred("animation", "Run")
		sprite_anim.flip_h = false
		
	elif Input.is_action_pressed("move_left"):
		motion.x=100*(-1)
		sprite_anim.set_deferred("animation", "Run")
		sprite_anim.flip_h = true
	else:
		sprite_anim.set_deferred("animation", "Idle")
		
	motion= motion.normalized()
	
	if Input.is_action_pressed("Run"):
		speed=runvel
	else:
		speed=velocidad
	motion = move_and_slide(motion*speed*delta)

func look_at_mause():
	var mause_pos = get_global_mouse_position()
	get_node("Pivot").look_at(mause_pos)
