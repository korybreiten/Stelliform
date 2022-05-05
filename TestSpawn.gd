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
	print(global_position)
	if Persistence.start_ship == 0:
		
		
		#Enemies
		var enemy1 = ship2.instance()
		enemy1.set_script(load("res://Ships/Enemy1.gd"))
		add_child(enemy1)
		enemy1.hull_hp = Persistence.enemy1_hp
		enemy1.planet = enemy1
#		Persistence._enemy_pos()
		enemy1.global_position = Vector2(global_position.x - 50, global_position.y)
		
		var player = ship4.instance()
		add_child(player)
		player.global_position = Vector2(global_position.x + 50, global_position.y)
		Persistence.player_track = player
