extends Area2D

var dentro = false



func _on_portalblue_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (body.get_name()=="Player2"):
		get_node("TeclaE").visible = true
		dentro = true


func _on_portalblue_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if (body.get_name()=="Player2"):
		dentro = false
		get_node("TeclaE").visible = false

func _process(delta):
	if Input.is_action_pressed("interactuar") && dentro == true:
		get_tree().change_scene("res://Scenes/Fondoprov.tscn")
