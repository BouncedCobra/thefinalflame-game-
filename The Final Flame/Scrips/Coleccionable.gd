extends Area2D
var coll
var n
var n1=0
var path = "res://valores/val.cfg"
var config = ConfigFile.new()
var points = 0
var apagados

func _ready():
	coll = 0
	config.load(path)
	apagados = config.get_value("Values", "apagados", apagados)
	get_node("../../Player2/Player2/collect2").text = str(apagados)


func _on_Coleccionable_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (body.get_name()=="Player"):
		
		n=(int(get_node("../../collect").text)+1)
		get_node("../../collect").text = str(n)
		queue_free()
	if (body.get_name()=="Player2"):
		config.load(path)
		points = config.get_value("Values", "points", points)
		points +=1
		
		get_node("../../Player2/Player2/collect2").text = str(points)
		config.set_value("Values", "points", points)
		config.save(path)
		queue_free()
