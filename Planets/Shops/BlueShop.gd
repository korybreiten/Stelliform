extends Node2D

onready var control = GlobalCamera.get_node("UI/Control")

func _process(_delta):
	$Control/Display/UpgradeLabel2.text = str(Persistence.SPEED)
	$Control/Display/CreditsLabel2.text = str(Persistence.score)
	if Persistence.blue_buy1 == false:
		$Control/Upgrade1/Cost1.text = ""
	if Persistence.blue_buy2 == false:
		$Control/Upgrade2/Cost2.text = ""


func _ready():
	$Control/Upgrade1.grab_focus()
	
	GlobalCamera.current = false
	control.visible = false


func _on_Exit_pressed():
	get_tree().change_scene("res://Game.tscn")

func _on_Upgrade1_pressed():
	if Persistence.score >= 200 and Persistence.blue_buy1:
		Persistence.blue_buy1 = false
		Persistence.score -= 200
		Persistence.SPEED = 75
	if Persistence.blue_buy1 == false:
		Persistence.SPEED = 75

func _on_Upgrade2_pressed():
	if Persistence.score >= 400 and Persistence.blue_buy2:
		Persistence.blue_buy2 = false
		Persistence.score -= 400
		Persistence.SPEED = 100
	if Persistence.blue_buy2 == false:
		Persistence.SPEED = 100
