extends Node2D
var volumen = 0
var x

func _ready():
	OS.window_maximized = true
	$Fondo.volume_db = Variablesglobales.vol
	$VSlider.value = Variablesglobales.vol
	if (Variablesglobales.tutorial == false):
		$Papiro.visible = false
		$Normal.visible = true
		$Infinito.visible = true
		$Extemo.visible = true
		$EXNUEVO.visible = true


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Fondoprov.tscn")
	


func _on_Infinito_pressed():
	get_tree().change_scene("res://Scenes/Modoinfinito.tscn")
	


func _on_Extemo_pressed():
	get_tree().change_scene("res://Scenes/Tortura.tscn")


func _on_Next_pressed():
	$Papiro/Label.visible = false
	$Papiro/Next.visible = false
	$Papiro/Label2.visible = true
	$Papiro/Label3.visible = true
	$Papiro/Label4.visible = true
	$Papiro/Next2.visible = true


func _on_Next2_pressed():
	$Normal.visible = true
	$Infinito.visible = true
	$Extemo.visible = true
	$EXNUEVO.visible = true
	$Papiro.visible = false
	Variablesglobales.tutorial = false


func _on_VSlider_value_changed(value):
	volumen = $VSlider.value
	Variablesglobales.vol = volumen
	$Fondo.volume_db = volumen


func _on_EXNUEVO_pressed():
	get_tree().change_scene("res://Scenes/Extremo.tscn")
