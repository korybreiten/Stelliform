extends Area2D


onready var explosion = $Explosion
var speed = 1
var dealer = null
var only_once = true
var start_pos = Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if only_once:
		start_pos = global_position
		only_once = false
	
	
	speed += 1
	position += transform.x * speed * delta
	if explosion.frame == 2:
		queue_free()
	
	if start_pos.distance_to(global_position) > 200:
		explosion.visible = true
		explosion.playing = true

func _on_Rocket_body_entered(body):
	if body != dealer:
		#if in group player, set collision
		if body.shield_hp > 0:
			body.shield_hp -= 20
			Persistence.score -= 20
		if body.shield_hp <= 0:
			body.hull_hp -= 20
			Persistence.score -= 20
		explosion.visible = true
		explosion.playing = true
