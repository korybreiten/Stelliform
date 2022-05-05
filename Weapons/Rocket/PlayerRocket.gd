extends Area2D


onready var explosion = $Explosion
var speed = 100
var damage = 10
var dealer = null
var only_once = true
var start_pos = Vector2.ZERO
var moving = true

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = Persistence.rocket_speed
	damage = Persistence.rocket_dmg


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if only_once:
		start_pos = global_position
		only_once = false
	
	
	speed += 1
	if moving:
		global_position += transform.x * speed * delta
	
	if start_pos.distance_to(global_position) > Persistence.rocket_max_range:
		explosion.visible = true
		var timer = Timer.new()
		timer.set_wait_time(0.2)
		timer.one_shot = true
		timer.connect("timeout",self,"explode")
		add_child(timer) #to process
		timer.start() #to start



func _on_Rocket_body_entered(body):
	if body != dealer:
		#if in group player, set collision
		if body.shield_hp > 0:
			body.shield_hp -= Persistence.rocket_dmg
			Persistence.score += Persistence.rocket_dmg
		if body.shield_hp <= 0:
			body.hull_hp -= Persistence.rocket_dmg
			Persistence.score += Persistence.rocket_dmg
		explosion.visible = true
		moving = false
		var timer = Timer.new()
		timer.set_wait_time(0.2)
		timer.one_shot = true
		timer.connect("timeout",self,"explode")
		add_child(timer) #to process
		timer.start() #to start
		
func explode():
	queue_free()

