extends Node2D

onready var control = GlobalCamera.get_node("UI/Control")

func _process(_delta):
	$Control/RocketReloadLabel2.text = str(Persistence.rocket_timer)
	$Control/RocketSpeedLabel2.text = str(Persistence.rocket_speed)
	$Control/ScoreLabel2.text = str(Persistence.score)

func _ready():
	$Control/RocketReload.grab_focus()
	
	GlobalCamera.current = false
	control.visible = false
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Button_pressed():
	get_tree().change_scene("res://Game.tscn")

func _on_RocketSpeed_pressed():
	if Persistence.score >= 100:
		Persistence.score -= 100
		Persistence.rocket_speed = 150

func _on_RocketReload_pressed():
	if Persistence.score >= 100:
		Persistence.score -= 100
		Persistence.rocket_timer = 0.5
