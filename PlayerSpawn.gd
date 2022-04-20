extends Position2D

onready var boss1 = load("res://Ships/Boss1/Boss1.tscn")
onready var boss2 = load("res://Ships/Boss2/Boss2.tscn")
onready var boss3 = load("res://Ships/Boss3/Boss3.tscn")
onready var boss4 = load("res://Ships/Boss4/Boss4.tscn")
onready var boss5 = load("res://Ships/Boss5/Boss5.tscn")
onready var boss6 = load("res://Ships/Boss6/Boss6.tscn")

onready var ship1 = load("res://Ships/Ship1/Ship1.tscn")
onready var ship2 = load("res://Ships/Ship2/Ship2.tscn")
onready var ship3 = load("res://Ships/Ship3/Ship3.tscn")
onready var ship4 = load("res://Ships/Ship4/Ship4.tscn")
onready var ship5 = load("res://Ships/Ship5/Ship5.tscn")
onready var ship6 = load("res://Ships/Ship6/Ship6.tscn")
onready var ship7 = load("res://Ships/Ship7/Ship7.tscn")

onready var planet1 = load("res://Planets/PlanetBlue/PlanetBlue.tscn")
onready var planet2 = load("res://Planets/PlanetGreen/PlanetGreen.tscn")
onready var planet3 = load("res://Planets/PlanetOrange/PlanetOrange.tscn")
onready var planet4 = load("res://Planets/PlanetPurple/PlanetPurple.tscn")
onready var planet5 = load("res://Planets/PlanetRed/PlanetRed.tscn")
onready var planet6 = load("res://Planets/PlanetYellow/PlanetYellow.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var planet_1 = planet1.instance()
	add_child(planet_1)
	planet_1.unlocked = 1
	planet_1.global_position = Persistence.blue_pos
	
	var planet_2 = planet2.instance()
	add_child(planet_2)
	planet_2.unlocked = 1
	planet_2.global_position = Persistence.green_pos
	
	var planet_3 = planet3.instance()
	add_child(planet_3)
	planet_3.unlocked = 1
	planet_3.global_position = Persistence.orange_pos
	
	var planet_4 = planet4.instance()
	add_child(planet_4)
	planet_4.unlocked = 1
	planet_4.global_position = Persistence.purple_pos
	
	var planet_5 = planet5.instance()
	add_child(planet_5)
	planet_5.unlocked = 1
	planet_5.global_position = Persistence.red_pos
	
	var planet_6 = planet6.instance()
	add_child(planet_6)
	planet_6.unlocked = 1
	planet_6.global_position = Persistence.yellow_pos
	
	#Bosses
	var blue = boss1.instance()
	blue.set_script(load("res://Ships/Blue.gd"))
	add_child(blue)
	blue.hull_hp = Persistence.blue_hull_hp
	blue.planet = planet_1
	blue.global_position = Persistence.blue_pos
	
	var green = boss2.instance()
	green.set_script(load("res://Ships/Green.gd"))
	add_child(green)
	green.hull_hp = Persistence.green_hull_hp
	green.planet = planet_2
	green.global_position = Persistence.green_pos
	
	var orange = boss3.instance()
	orange.set_script(load("res://Ships/Orange.gd"))
	add_child(orange)
	orange.hull_hp = Persistence.orange_hull_hp
	orange.planet = planet_3
	orange.global_position = Persistence.orange_pos
	
	var purple = boss4.instance()
	purple.set_script(load("res://Ships/Purple.gd"))
	add_child(purple)
	purple.hull_hp = Persistence.purple_hull_hp
	purple.planet = planet_4
	purple.global_position = Persistence.purple_pos
	
	var red = boss5.instance()
	red.set_script(load("res://Ships/Red.gd"))
	add_child(red)
	red.hull_hp = Persistence.red_hull_hp
	red.planet = planet_5
	red.global_position = Persistence.red_pos
	
	var yellow = boss6.instance()
	yellow.set_script(load("res://Ships/Yellow.gd"))
	add_child(yellow)
	yellow.hull_hp = Persistence.yellow_hull_hp
	yellow.planet = planet_6
	yellow.global_position = Persistence.yellow_pos
	
	
	
	if Persistence.start_ship == 1:
		
		
		#Enemies
		var enemy1 = ship2.instance()
		enemy1.set_script(load("res://Ships/Enemy1.gd"))
		add_child(enemy1)
		enemy1.hull_hp = Persistence.enemy1_hp
		enemy1.planet = enemy1
		Persistence._enemy_pos()
		enemy1.global_position = Persistence.enemy_pos
		
		var enemy2 = ship3.instance()
		enemy2.set_script(load("res://Ships/Enemy2.gd"))
		add_child(enemy2)
		enemy2.hull_hp = Persistence.enemy2_hp
		enemy2.planet = enemy2
		Persistence._enemy_pos()
		enemy2.global_position = Persistence.enemy_pos
		
		var enemy3 = ship4.instance()
		enemy3.set_script(load("res://Ships/Enemy3.gd"))
		add_child(enemy3)
		enemy3.hull_hp = Persistence.enemy3_hp
		enemy3.planet = enemy3
		Persistence._enemy_pos()
		enemy3.global_position = Persistence.enemy_pos
		
		var enemy4 = ship5.instance()
		enemy4.set_script(load("res://Ships/Enemy4.gd"))
		add_child(enemy4)
		enemy4.hull_hp = Persistence.enemy4_hp
		enemy4.planet = enemy4
		Persistence._enemy_pos()
		enemy4.global_position = Persistence.enemy_pos
		
		var enemy5 = ship6.instance()
		enemy5.set_script(load("res://Ships/Enemy5.gd"))
		add_child(enemy5)
		enemy5.hull_hp = Persistence.enemy5_hp
		enemy5.planet = enemy5
		Persistence._enemy_pos()
		enemy5.global_position = Persistence.enemy_pos
		
		var enemy6 = ship7.instance()
		enemy6.set_script(load("res://Ships/Enemy6.gd"))
		add_child(enemy6)
		enemy6.hull_hp = Persistence.enemy6_hp
		enemy6.planet = enemy6
		Persistence._enemy_pos()
		enemy6.global_position = Persistence.enemy_pos
		
		
		
		
		var player = ship1.instance()
		add_child(player)
		player.global_position = Persistence.player_pos
		Persistence.player_track = player
		


		
		
	if Persistence.start_ship == 2:
		
		#Enemies
		var enemy1 = ship1.instance()
		enemy1.set_script(load("res://Ships/Enemy1.gd"))
		add_child(enemy1)
		enemy1.hull_hp = Persistence.enemy1_hp
		enemy1.planet = enemy1
		Persistence._enemy_pos()
		enemy1.global_position = Persistence.enemy_pos
		
		var enemy2 = ship3.instance()
		enemy2.set_script(load("res://Ships/Enemy2.gd"))
		add_child(enemy2)
		enemy2.hull_hp = Persistence.enemy2_hp
		enemy2.planet = enemy2
		Persistence._enemy_pos()
		enemy2.global_position = Persistence.enemy_pos
		
		var enemy3 = ship4.instance()
		enemy3.set_script(load("res://Ships/Enemy3.gd"))
		add_child(enemy3)
		enemy3.hull_hp = Persistence.enemy3_hp
		enemy3.planet = enemy3
		Persistence._enemy_pos()
		enemy3.global_position = Persistence.enemy_pos
		
		var enemy4 = ship5.instance()
		enemy4.set_script(load("res://Ships/Enemy4.gd"))
		add_child(enemy4)
		enemy4.hull_hp = Persistence.enemy4_hp
		enemy4.planet = enemy4
		Persistence._enemy_pos()
		enemy4.global_position = Persistence.enemy_pos
		
		var enemy5 = ship6.instance()
		enemy5.set_script(load("res://Ships/Enemy5.gd"))
		add_child(enemy5)
		enemy5.hull_hp = Persistence.enemy5_hp
		enemy5.planet = enemy5
		Persistence._enemy_pos()
		enemy5.global_position = Persistence.enemy_pos
		
		var enemy6 = ship7.instance()
		enemy6.set_script(load("res://Ships/Enemy6.gd"))
		add_child(enemy6)
		enemy6.hull_hp = Persistence.enemy6_hp
		enemy6.planet = enemy6
		Persistence._enemy_pos()
		enemy6.global_position = Persistence.enemy_pos		
		
		
		
		var player = ship2.instance()
		add_child(player)
		player.global_position = Persistence.player_pos
		Persistence.player_track = player


	if Persistence.start_ship == 3:
		
		#Enemies
		var enemy1 = ship1.instance()
		enemy1.set_script(load("res://Ships/Enemy1.gd"))
		add_child(enemy1)
		enemy1.hull_hp = Persistence.enemy1_hp
		enemy1.planet = enemy1
		Persistence._enemy_pos()
		enemy1.global_position = Persistence.enemy_pos
		
		var enemy2 = ship2.instance()
		enemy2.set_script(load("res://Ships/Enemy2.gd"))
		add_child(enemy2)
		enemy2.hull_hp = Persistence.enemy2_hp
		enemy2.planet = enemy2
		Persistence._enemy_pos()
		enemy2.global_position = Persistence.enemy_pos
		
		var enemy3 = ship4.instance()
		enemy3.set_script(load("res://Ships/Enemy3.gd"))
		add_child(enemy3)
		enemy3.hull_hp = Persistence.enemy3_hp
		enemy3.planet = enemy3
		Persistence._enemy_pos()
		enemy3.global_position = Persistence.enemy_pos
		
		var enemy4 = ship5.instance()
		enemy4.set_script(load("res://Ships/Enemy4.gd"))
		add_child(enemy4)
		enemy4.hull_hp = Persistence.enemy4_hp
		enemy4.planet = enemy4
		Persistence._enemy_pos()
		enemy4.global_position = Persistence.enemy_pos
		
		var enemy5 = ship6.instance()
		enemy5.set_script(load("res://Ships/Enemy5.gd"))
		add_child(enemy5)
		enemy5.hull_hp = Persistence.enemy5_hp
		enemy5.planet = enemy5
		Persistence._enemy_pos()
		enemy5.global_position = Persistence.enemy_pos
		
		var enemy6 = ship7.instance()
		enemy6.set_script(load("res://Ships/Enemy6.gd"))
		add_child(enemy6)
		enemy6.hull_hp = Persistence.enemy6_hp
		enemy6.planet = enemy6
		Persistence._enemy_pos()
		enemy6.global_position = Persistence.enemy_pos		
		
		
		
		var player = ship3.instance()
		add_child(player)
		player.global_position = Persistence.player_pos
		Persistence.player_track = player


	if Persistence.start_ship == 4:
		
		#Enemies
		var enemy1 = ship1.instance()
		enemy1.set_script(load("res://Ships/Enemy1.gd"))
		add_child(enemy1)
		enemy1.hull_hp = Persistence.enemy1_hp
		enemy1.planet = enemy1
		Persistence._enemy_pos()
		enemy1.global_position = Persistence.enemy_pos
		
		var enemy2 = ship2.instance()
		enemy2.set_script(load("res://Ships/Enemy2.gd"))
		add_child(enemy2)
		enemy2.hull_hp = Persistence.enemy2_hp
		enemy2.planet = enemy2
		Persistence._enemy_pos()
		enemy2.global_position = Persistence.enemy_pos
		
		var enemy3 = ship3.instance()
		enemy3.set_script(load("res://Ships/Enemy3.gd"))
		add_child(enemy3)
		enemy3.hull_hp = Persistence.enemy3_hp
		enemy3.planet = enemy3
		Persistence._enemy_pos()
		enemy3.global_position = Persistence.enemy_pos
		
		var enemy4 = ship5.instance()
		enemy4.set_script(load("res://Ships/Enemy4.gd"))
		add_child(enemy4)
		enemy4.hull_hp = Persistence.enemy4_hp
		enemy4.planet = enemy4
		Persistence._enemy_pos()
		enemy4.global_position = Persistence.enemy_pos
		
		var enemy5 = ship6.instance()
		enemy5.set_script(load("res://Ships/Enemy5.gd"))
		add_child(enemy5)
		enemy5.hull_hp = Persistence.enemy5_hp
		enemy5.planet = enemy5
		Persistence._enemy_pos()
		enemy5.global_position = Persistence.enemy_pos
		
		var enemy6 = ship7.instance()
		enemy6.set_script(load("res://Ships/Enemy6.gd"))
		add_child(enemy6)
		enemy6.hull_hp = Persistence.enemy6_hp
		enemy6.planet = enemy6
		Persistence._enemy_pos()
		enemy6.global_position = Persistence.enemy_pos		
		
		
		
		var player = ship4.instance()
		add_child(player)
		player.global_position = Persistence.player_pos
		Persistence.player_track = player


	if Persistence.start_ship == 5:
		
		#Enemies
		var enemy1 = ship1.instance()
		enemy1.set_script(load("res://Ships/Enemy1.gd"))
		add_child(enemy1)
		enemy1.hull_hp = Persistence.enemy1_hp
		enemy1.planet = enemy1
		Persistence._enemy_pos()
		enemy1.global_position = Persistence.enemy_pos
		
		var enemy2 = ship2.instance()
		enemy2.set_script(load("res://Ships/Enemy2.gd"))
		add_child(enemy2)
		enemy2.hull_hp = Persistence.enemy2_hp
		enemy2.planet = enemy2
		Persistence._enemy_pos()
		enemy2.global_position = Persistence.enemy_pos
		
		var enemy3 = ship3.instance()
		enemy3.set_script(load("res://Ships/Enemy3.gd"))
		add_child(enemy3)
		enemy3.hull_hp = Persistence.enemy3_hp
		enemy3.planet = enemy3
		Persistence._enemy_pos()
		enemy3.global_position = Persistence.enemy_pos
		
		var enemy4 = ship4.instance()
		enemy4.set_script(load("res://Ships/Enemy4.gd"))
		add_child(enemy4)
		enemy4.hull_hp = Persistence.enemy4_hp
		enemy4.planet = enemy4
		Persistence._enemy_pos()
		enemy4.global_position = Persistence.enemy_pos
		
		var enemy5 = ship6.instance()
		enemy5.set_script(load("res://Ships/Enemy5.gd"))
		add_child(enemy5)
		enemy5.hull_hp = Persistence.enemy5_hp
		enemy5.planet = enemy5
		Persistence._enemy_pos()
		enemy5.global_position = Persistence.enemy_pos
		
		var enemy6 = ship7.instance()
		enemy6.set_script(load("res://Ships/Enemy6.gd"))
		add_child(enemy6)
		enemy6.hull_hp = Persistence.enemy6_hp
		enemy6.planet = enemy6
		Persistence._enemy_pos()
		enemy6.global_position = Persistence.enemy_pos		
		
		
		
		var player = ship5.instance()
		add_child(player)
		player.global_position = Persistence.player_pos
		Persistence.player_track = player


	if Persistence.start_ship == 6:
		
		#Enemies
		var enemy1 = ship1.instance()
		enemy1.set_script(load("res://Ships/Enemy1.gd"))
		add_child(enemy1)
		enemy1.hull_hp = Persistence.enemy1_hp
		enemy1.planet = enemy1
		Persistence._enemy_pos()
		enemy1.global_position = Persistence.enemy_pos
		
		var enemy2 = ship2.instance()
		enemy2.set_script(load("res://Ships/Enemy2.gd"))
		add_child(enemy2)
		enemy2.hull_hp = Persistence.enemy2_hp
		enemy2.planet = enemy2
		Persistence._enemy_pos()
		enemy2.global_position = Persistence.enemy_pos
		
		var enemy3 = ship3.instance()
		enemy3.set_script(load("res://Ships/Enemy3.gd"))
		add_child(enemy3)
		enemy3.hull_hp = Persistence.enemy3_hp
		enemy3.planet = enemy3
		Persistence._enemy_pos()
		enemy3.global_position = Persistence.enemy_pos
		
		var enemy4 = ship4.instance()
		enemy4.set_script(load("res://Ships/Enemy4.gd"))
		add_child(enemy4)
		enemy4.hull_hp = Persistence.enemy4_hp
		enemy4.planet = enemy4
		Persistence._enemy_pos()
		enemy4.global_position = Persistence.enemy_pos
		
		var enemy5 = ship5.instance()
		enemy5.set_script(load("res://Ships/Enemy5.gd"))
		add_child(enemy5)
		enemy5.hull_hp = Persistence.enemy5_hp
		enemy5.planet = enemy5
		Persistence._enemy_pos()
		enemy5.global_position = Persistence.enemy_pos
		
		var enemy6 = ship6.instance()
		enemy6.set_script(load("res://Ships/Enemy6.gd"))
		add_child(enemy6)
		enemy6.hull_hp = Persistence.enemy6_hp
		enemy6.planet = enemy6
		Persistence._enemy_pos()
		enemy6.global_position = Persistence.enemy_pos		
		
		
		
		var player = ship7.instance()
		add_child(player)
		player.global_position = Persistence.player_pos
		Persistence.player_track = player
