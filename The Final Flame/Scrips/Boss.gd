extends Area2D
var pv1 = 0
var pv2 = 4
var cont = 0
var vidas
var pos
var direccion
var origen
var bosslife = 25

func _ready():
	vidas = Variablesglobales.vidas
	bosslife = Variablesglobales.bosslife
	
func _physics_process(delta):
	origen = global_position

		



