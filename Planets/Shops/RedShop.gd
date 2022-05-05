extends Node2D

onready var control = GlobalCamera.get_node("UI/Control")

func _process(_delta):
	$Control/Display/UpgradeLabel2.text = str(Persistence.rocket_timer) + "sec"
	$Control/Display/CreditsLabel2.text = str(Persistence.score)
	if Persistence.red_buy1 == false:
		$Control/Upgrade1/Cost1.text = ""
	if Persistence.red_buy2 == false:
		$Control/Upgrade2/Cost2.text = ""

func _ready():
	$Control/Upgrade1.grab_focus()
	
	GlobalCamera.current = false
	control.visible = false

func _on_Exit_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_Upgrade1_pressed():
	if Persistence.score >= 100 and Persistence.red_buy1:
		Persistence.red_buy1 = false
		Persistence.score -= 100
		Persistence.rocket_timer = 0.65
	if Persistence.red_buy1 == false:
		Persistence.rocket_timer = 0.65


func _on_Upgrade2_pressed():
	if Persistence.score >= 200 and Persistence.red_buy2:
		Persistence.red_buy2 = false
		Persistence.score -= 200
		Persistence.rocket_timer = 0.50
	if Persistence.red_buy2 == false:
		Persistence.rocket_timer = 0.50
