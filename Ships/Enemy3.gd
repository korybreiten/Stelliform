extends KinematicBody2D

const SPEED = 1000

var move_direction = Vector2.RIGHT

var can_shoot = true
var can_charge = true
var in_range = false
var projectile = null

# HULL SYSTEMS
var hull_hp = 100
var shield_hp = 100
var max_shield_hp = 100
var last_shield_hp = 100

onready var pos = $base/Position2D

var move_input = Vector2.ZERO
var velocity = Vector2.ZERO
var target = Vector2.ZERO
var planet = null

var randint = 150
var rng = RandomNumberGenerator.new()
var randx = 0
var randy = 0

onready var rocket = load("res://Weapons/Rocket/EnemyRocket.tscn")
onready var laser = load("res://Weapons/Laser/EnemyLaser.tscn")

var do_once = true
var stun_once = true
var stunned = false

func _ready():
	add_to_group("Enemy")
	
	var timer = Timer.new()
	timer.set_wait_time(3)
	timer.one_shot = false
	timer.connect("timeout",self,"seek")
	add_child(timer) #to process
	timer.start() #to start

func _physics_process(delta):
	
	if hull_hp <= 0 and do_once == true:
		do_once = false
		can_shoot = false
		#SET THIS FOR NEW ENEMY
		Persistence.enemy3_hp = 0
		remove_from_group("Enemy")
		$Explosion.visible = true
		$Explosion.playing = true
		queue_free()
	
	if !stunned:
		if global_position.distance_to(Persistence.player_track.global_position) < 100:
			look_at(Persistence.player_track.global_position)
			in_range = true
		else:
			look_at(target)
			in_range = false
			
		velocity = global_position.direction_to(target)
	
		if global_position.distance_to(target) > 5:
			velocity = move_and_slide(velocity * SPEED * delta)
		
	if velocity != Vector2.ZERO:
		$base/Thrust.visible = true
		$base/Thrust.playing = true
	else:
		$base/Thrust.visible = false
		$base/Thrust.playing = false
		
	if shield_hp < last_shield_hp:
		last_shield_hp = shield_hp
		$base/Shield.frame = 0
		$base/Shield.visible = true
		$base/Shield.playing = true
	if $base/Shield.frame == 3:
		$base/Shield.visible = false
		$base/Shield.playing = false
		
	if in_range and !stunned:
		shoot()
			
	if can_charge and shield_hp < max_shield_hp:
		var timer = Timer.new()
		timer.set_wait_time(1)
		timer.one_shot = true
		timer.connect("timeout",self,"recharge")
		add_child(timer) #to process
		timer.start() #to start
		can_charge = false
		
	if stunned and stun_once == true:
		var timer = Timer.new()
		timer.set_wait_time(5)
		timer.one_shot = true
		timer.connect("timeout",self,"resume")
		add_child(timer) #to process
		timer.start() #to start
		stun_once = false
			
func seek():
	var dir = true
	if randi() % 2:
		dir = false
	rng.randomize()
	randx = rng.randf_range(-randint, randint)
	randy = rng.randf_range(-randint, randint)

	if target and in_range:

		if dir:
			target = Persistence.player_track.global_position + Vector2(randx, randy)
		if not dir:
			target = Persistence.player_track.global_position - Vector2(randx, randy)

	else:
		if dir:
			target = planet.global_position + Vector2(randx, randy)
		if not dir:
			target = planet.global_position - Vector2(randx, randy)


func recharge():
	shield_hp += 1
	last_shield_hp = shield_hp
	shield_hp = clamp(shield_hp, 0, max_shield_hp)
	can_charge = true

func shoot():
	
	if can_shoot:
		var timer = Timer.new()
		timer.set_wait_time(1.5)
		timer.one_shot = true
		timer.connect("timeout",self,"shooting")
		add_child(timer) #to process
		timer.start() #to start
		
		projectile = rocket.instance()
			
		get_tree().get_root().add_child(projectile)
		projectile.global_transform = pos.global_transform
		projectile.dealer = self
		can_shoot = false
		
func shooting():
	can_shoot = true

func resume():
	stun_once = true
	stunned = false
