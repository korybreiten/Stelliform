extends Area2D


onready var explosion = $Explosion
onready var sprite = $AnimatedSprite
onready var pew = $Pew
var dealer = null
var only_once = true
var start_pos = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.animation = "start"
	sprite.playing = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if only_once:
		start_pos = global_position
		only_once = false
		
	position += transform.x * Persistence.laser_speed * delta
	if sprite.animation == "end":
		if sprite.frame == 2:
			queue_free()
			
	if start_pos.distance_to(global_position) > Persistence.laser_max_range:
		sprite.animation = "end"
		sprite.playing = true

func _on_Laser_body_entered(body):
	if body != dealer:
		if body.shield_hp > 0:
			body.shield_hp -= Persistence.laser_dmg
			Persistence.score += Persistence.laser_dmg
		if body.shield_hp <= 0:
			body.hull_hp -= Persistence.laser_dmg
			Persistence.score += Persistence.laser_dmg
		sprite.animation = "end"
		sprite.playing = true
		explosion.visible = true
		explosion.playing = true
