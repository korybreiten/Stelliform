extends KinematicBody2D

var SPEED = 50

var move_direction = Vector2.RIGHT
var aim_direction = Vector2.RIGHT
var map_size = Vector2(2000,2000)
var can_shoot = true
var can_charge = true
var in_range = true
var projectile = null

# HULL SYSTEMS
var hull_hp = 100
var shield_hp = 100
var max_shield_hp = 100
var last_shield_hp = 100

onready var pos = $base/Position2D
onready var camera = GlobalCamera
onready var hull_bar = GlobalCamera.get_node("UI/Control/Hull_Bar")
onready var shield_bar = GlobalCamera.get_node("UI/Control/Shield_Bar")
onready var weapon_type = GlobalCamera.get_node("UI/Control/Weapon")
onready var control = GlobalCamera.get_node("UI/Control")
var move_input = Vector2.ZERO
var velocity = Vector2.ZERO
onready var rocket = load("res://Weapons/Rocket/PlayerRocket.tscn")
onready var laser = load("res://Weapons/Laser/PlayerLaser.tscn")
onready var ballistic = load("res://Weapons/Ballistic/PlayerBallistic.tscn")
onready var lightning = load("res://Weapons/Lightning/PlayerLightning.tscn")

func _ready():
	GlobalCamera.current = true
	control.visible = true
	
func _physics_process(delta):
	SPEED = Persistence.SPEED
	GlobalCamera.global_position = Vector2(global_position.x - 200, global_position.y - 100)
	
	hull_bar.value = hull_hp
	shield_bar.value = shield_hp
	
	weapon_type.text = Persistence.weapon
	
	if hull_hp <= 0:
		$Explosion.visible = true
		$Explosion.playing = true
		var timer = Timer.new()
		timer.set_wait_time(2)
		timer.one_shot = true
		timer.connect("timeout",self,"reload_scene")
		add_child(timer) #to process
		timer.start() #to start
		
	
	if global_position.x > map_size.x:
		global_position.x = 0
	if global_position.x < 0:
		global_position.x = map_size.x
	if global_position.y > map_size.y:
		global_position.y = 0
	if global_position.y < 0:
		global_position.y = map_size.y
	
	if hull_hp > 0:
		move_input += Vector2(
			Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
			Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		)
		
		move_input = Vector2(clamp(move_input.x,-SPEED,SPEED),clamp(move_input.y,-SPEED,SPEED))
		
		move_input.x = lerp(move_input.x, 0, 0.005)
		move_input.y = lerp(move_input.y, 0, 0.005)
		
		if move_input != Vector2.ZERO:
			move_direction = move_input
		
		var aim_input = Vector2(
			Input.get_action_strength("aim_right") - Input.get_action_strength("aim_left"),
			Input.get_action_strength("aim_down") - Input.get_action_strength("aim_up")
		)
		
		if aim_input != Vector2.ZERO:
			aim_direction = aim_input
		
		if Input.get_joy_name(0) != "": # Controller
			Input.set_mouse_mode(1)
			$base.rotation = aim_direction.angle()
		elif Input.get_joy_name(0) == "": # Keyboard 
			Input.set_mouse_mode(0)
			$base.look_at(get_global_mouse_position())
		elif move_input:
			$base.rotation = move_direction.angle()
			
		velocity = move_and_slide(move_input * SPEED * delta)
		
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
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
			
		if aim_input or Input.is_action_pressed("shoot"):
			shoot()
			
		if Input.is_action_just_pressed("weapon"):
			if Persistence.weapon == "Rocket":
				Persistence.weapon = "Laser"
			elif Persistence.weapon == "Laser":
				Persistence.weapon = "Ballistic"
			elif Persistence.weapon == "Ballistic":
				Persistence.weapon = "Lightning"
			elif Persistence.weapon == "Lightning":
				Persistence.weapon = "Rocket"
			
		if can_charge and shield_hp < max_shield_hp:
			var timer = Timer.new()
			timer.set_wait_time(1)
			timer.one_shot = true
			timer.connect("timeout",self,"recharge")
			add_child(timer) #to process
			timer.start() #to start
			can_charge = false
			
func recharge():
	shield_hp += 1
	last_shield_hp = shield_hp
	shield_hp = clamp(shield_hp, 0, max_shield_hp)
	can_charge = true

func shoot():
	
	if can_shoot:
		if Persistence.weapon == "Rocket":
			var timer = Timer.new()
			timer.set_wait_time(Persistence.rocket_timer)
			timer.one_shot = true
			timer.connect("timeout",self,"shooting")
			add_child(timer) #to process
			timer.start() #to start
			
			projectile = rocket.instance()
			
		if Persistence.weapon == "Laser":
			var timer = Timer.new()
			timer.set_wait_time(Persistence.laser_timer)
			timer.one_shot = true
			timer.connect("timeout",self,"shooting")
			add_child(timer) #to process
			timer.start() #to start
			
			projectile = laser.instance()
			
		if Persistence.weapon == "Ballistic":
			var timer = Timer.new()
			timer.set_wait_time(Persistence.ballistic_timer)
			timer.one_shot = true
			timer.connect("timeout",self,"shooting")
			add_child(timer) #to process
			timer.start() #to start
			
			projectile = ballistic.instance()
			
		if Persistence.weapon == "Lightning":
			var timer = Timer.new()
			timer.set_wait_time(Persistence.lightning_timer)
			timer.one_shot = true
			timer.connect("timeout",self,"shooting")
			add_child(timer) #to process
			timer.start() #to start
			
			projectile = lightning.instance()
			
		get_tree().get_root().add_child(projectile)
		projectile.global_transform = pos.global_transform
		projectile.dealer = self
		can_shoot = false
			
func shooting():
	can_shoot = true
			
func reload_scene():
	GlobalCamera.get_node("UI/Control/GameOver").visible = true
	get_tree().paused = true	
