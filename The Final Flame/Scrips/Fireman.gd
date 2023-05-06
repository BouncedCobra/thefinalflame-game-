extends Node2D

func _on_Player1_body_entered(body):
	print(body.get_name())
	hide()

