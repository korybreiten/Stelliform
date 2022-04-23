extends Area2D


onready var explosion = $Explosion
var speed = 200
var damage = 5
var dealer = null
var only_once = true
var start_pos = Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if only_once:
		start_pos = global_position
		only_once = false
	
	
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
		explosion.playing = true
