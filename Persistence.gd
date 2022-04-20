extends Node

var rng = RandomNumberGenerator.new()
var randx = 0
var randy = 0

#General
var scene = ""
var score = 0
var start_ship = 0
var player_track = null


var orange_track = null
var blue_track = null
var purple_track = null
var green_track = null
var red_track = null
var yellow_track = null

#Positions
var player_pos = Vector2.ZERO
var enemy_pos = Vector2.ZERO
var orange_pos = Vector2.ZERO
var blue_pos = Vector2.ZERO
var purple_pos = Vector2.ZERO
var green_pos = Vector2.ZERO
var red_pos = Vector2.ZERO
var yellow_pos = Vector2.ZERO


#Bosses
var orange_hull_hp = 200
var orange_shield_hp = 200

var blue_hull_hp = 200
var blue_shield_hp = 200

var purple_hull_hp = 200
var purple_shield_hp = 200

var green_hull_hp = 200
var green_shield_hp = 200

var red_hull_hp = 200
var red_shield_hp = 200

var yellow_hull_hp = 200
var yellow_shield_hp = 200

var orange_score = true
var blue_score = true
var purple_score = true
var green_score = true
var red_score = true
var yellow_score = true

#Enemies
var enemy1_hp = 100
var enemy2_hp = 100
var enemy3_hp = 100
var enemy4_hp = 100
var enemy5_hp = 100
var enemy6_hp = 100

var e1_score = true
var e2_score = true
var e3_score = true
var e4_score = true
var e5_score = true
var e6_score = true

#Weapons
var weapon = "Ballistic"

var rocket_speed = 100
var rocket_dmg = 20
var rocket_timer = 1.0
var rocket_max_range = 75

var ballistic_speed = 200
var ballistic_dmg = 5
var ballistic_timer = 0.25
var ballistic_max_range = 100

var laser_speed = 100
var laser_dmg = 10
var laser_timer = 0.5
var laser_max_range = 100

func save():
	var save_dict = {
		"filename" : "res://Persistence.gd",
		"parent" : get_parent().get_path(),
		"player_pos_x" : player_pos.x,
		"player_pos_y" : player_pos.y,
		"weapon" : weapon,
	}
	return save_dict

func _player_pos():
	rng.randomize()
	randx = rng.randf_range(300, 1700)
	randy = rng.randf_range(300, 1700)
	player_pos = Vector2(randx, randy)
	
func _enemy_pos():
	rng.randomize()
	randx = rng.randf_range(300, 1700)
	randy = rng.randf_range(300, 1700)
	enemy_pos = Vector2(randx, randy)

func _orange_pos():
	rng.randomize()
	randx = rng.randf_range(300, 800)
	randy = rng.randf_range(300, 600)
	orange_pos = Vector2(randx, randy)
	
func _blue_pos():
	rng.randomize()
	randx = rng.randf_range(1200, 1700)
	randy = rng.randf_range(300, 600)
	blue_pos = Vector2(randx, randy)
	
func _purple_pos():
	rng.randomize()
	randx = rng.randf_range(1200, 1700)
	randy = rng.randf_range(1400, 1700)
	purple_pos = Vector2(randx, randy)
	
func _green_pos():
	rng.randomize()
	randx = rng.randf_range(300, 800)
	randy = rng.randf_range(1400, 1700)
	green_pos = Vector2(randx, randy)

func _red_pos():
	rng.randomize()
	randx = rng.randf_range(300, 800)
	randy = rng.randf_range(900, 1300)
	red_pos = Vector2(randx, randy)
	
func _yellow_pos():
	rng.randomize()
	randx = rng.randf_range(1200, 1700)
	randy = rng.randf_range(900, 1300)
	yellow_pos = Vector2(randx, randy)

func _process(_delta):
	if enemy1_hp <= 0 and e1_score:
		e1_score = false
		score += 50
	if enemy2_hp <= 0 and e2_score:
		e2_score = false
		score += 50
	if enemy3_hp <= 0 and e3_score:
		e3_score = false
		score += 50
	if enemy4_hp <= 0 and e4_score:
		e4_score = false
		score += 50
	if enemy5_hp <= 0 and e5_score:
		e5_score = false
		score += 50
	if enemy6_hp <= 0 and e6_score:
		e6_score = false
		score += 50
	if orange_hull_hp <= 0 and orange_score:
		orange_score = false
		score += 100
	if blue_hull_hp <= 0 and blue_score:
		blue_score = false
		score += 100
	if green_hull_hp <= 0 and green_score:
		green_score = false
		score += 100
	if purple_hull_hp <= 0 and purple_score:
		purple_score = false
		score += 100
	if red_hull_hp <= 0 and red_score:
		red_score = false
		score += 100
	if yellow_hull_hp <= 0 and yellow_score:
		yellow_score = false
		score += 100
