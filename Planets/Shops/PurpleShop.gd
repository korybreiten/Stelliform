extends Node2D

onready var control = GlobalCamera.get_node("UI/Control")

func _process(_delta):
	$Control/Display/UpgradeLabel2.text = str(Persistence.ballistic_speed)
	$Control/Display/CreditsLabel2.text = str(Persistence.score)
	if Persistence.purple_buy1 == false:
		$Control/Upgrade1/Cost1.text = ""
	if Persistence.purple_buy2 == false:
		$Control/Upgrade2/Cost2.text = ""

func _ready():
	$Control/Upgrade1.grab_focus()
	
	GlobalCamera.current = false
	control.visible = false


func _on_Exit_pressed():
	get_tree().change_scene("res://Game.tscn")

func _on_Upgrade1_pressed():
	if Persistence.score >= 100 and Persistence.purple_buy1:
		Persistence.purple_buy1 = false
		Persistence.score -= 100
		Persistence.ballistic_speed = 300
	if Persistence.purple_buy1 == false:
		Persistence.ballistic_speed = 400

func _on_Upgrade2_pressed():
	if Persistence.score >= 200 and Persistence.purple_buy2:
		Persistence.purple_buy2 = false
		Persistence.score -= 200
		Persistence.ballistic_speed = 500
	if Persistence.purple_buy2 == false:
		Persistence.ballistic_speed = 500
