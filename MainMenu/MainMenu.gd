extends Control


onready var label = $Label
onready var control = GlobalCamera.get_node("UI/Control")
var change_scene = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$Start.grab_focus()
	
	GlobalCamera.current = false
	control.visible = false
	
	Persistence.score = 0
	Persistence.weapon = "Ballistic"
	Persistence.SPEED = 50
	
	Persistence.orange_buy1 = true
	Persistence.orange_buy2 = true
	Persistence.blue_buy1 = true
	Persistence.blue_buy2 = true
	Persistence.purple_buy1 = true
	Persistence.purple_buy2 = true
	Persistence.green_buy1 = true
	Persistence.green_buy2 = true
	Persistence.red_buy1 = true
	Persistence.red_buy2 = true
	Persistence.yellow_buy1 = true
	Persistence.yellow_buy2 = true
	
	Persistence.rocket_speed = 100
	Persistence.rocket_dmg = 15
	Persistence.rocket_timer = 1
	Persistence.rocket_max_range = 100

	Persistence.laser_speed = 100
	Persistence.laser_dmg = 10
	Persistence.laser_timer = 0.75
	Persistence.laser_max_range = 100

	Persistence.ballistic_speed = 300
	Persistence.ballistic_dmg = 5
	Persistence.ballistic_timer = 0.25
	Persistence.ballistic_max_range = 100

	Persistence.enemy1_hp = 100
	Persistence.enemy2_hp = 100
	Persistence.enemy3_hp = 100
	Persistence.enemy4_hp = 100
	Persistence.enemy5_hp = 100
	Persistence.enemy6_hp = 100
	
	Persistence.orange_hull_hp = 200
	Persistence.orange_shield_hp = 200

	Persistence.blue_hull_hp = 200
	Persistence.blue_shield_hp = 200

	Persistence.purple_hull_hp = 200
	Persistence.purple_shield_hp = 200

	Persistence.green_hull_hp = 200
	Persistence.green_shield_hp = 200

	Persistence.red_hull_hp = 200
	Persistence.red_shield_hp = 200

	Persistence.yellow_hull_hp = 200
	Persistence.yellow_shield_hp = 200
	
	Persistence._player_pos()
	Persistence._enemy_pos()
	Persistence._orange_pos()
	Persistence._blue_pos()
	Persistence._purple_pos()
	Persistence._green_pos()
	Persistence._red_pos()
	Persistence._yellow_pos()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Race1_pressed():
	Persistence.start_ship = 1
	label.text = "RACE 1"

func _on_Race2_pressed():
	Persistence.start_ship = 2
	label.text = "RACE 2"
	
func _on_Race3_pressed():
	Persistence.start_ship = 3
	label.text = "RACE 3"
	
func _on_Race4_pressed():
	Persistence.start_ship = 4
	label.text = "RACE 4"
	
func _on_Race5_pressed():
	Persistence.start_ship = 5
	label.text = "RACE 5"
	
func _on_Race6_pressed():
	Persistence.start_ship = 6
	label.text = "RACE 6"
	
func _on_Start_pressed():
	if Persistence.start_ship != 0:
		change_scene = get_tree().change_scene("res://Game.tscn")

func _on_Quit_pressed():
	get_tree().quit()
