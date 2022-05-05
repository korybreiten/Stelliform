extends Area2D


onready var explosion = $Explosion
var speed = 150
var damage = 5
var dealer = null
var only_once = true
var start_pos = Vector2.ZERO
var moving = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if only_once:
		start_pos = global_position
		only_once = false
	
	if moving:
		position += transform.x * speed * delta
		
	
	if start_pos.distance_to(global_position) > 200:
		queue_free()

func _on_Ballistic_body_entered(body):
	if body != dealer:
		#if in group player, set collision
		if body.shield_hp > 0:
			body.shield_hp -= 5
			Persistence.score -= 5
		if body.shield_hp <= 0:
			body.hull_hp -= 5
			Persistence.score -= 5
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


