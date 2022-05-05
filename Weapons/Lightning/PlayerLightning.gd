extends Area2D


onready var explosion = $Explosion
onready var sprite = $AnimatedSprite
onready var pew = $Pew
var dealer = null
var only_once = true
var start_pos = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.playing = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if only_once:
		start_pos = global_position
		only_once = false
		
	position += transform.x * Persistence.lightning_speed * delta
			
	if start_pos.distance_to(global_position) > Persistence.lightning_max_range:
		queue_free()

func _on_Laser_body_entered(body):
	if body != dealer:
		body.stunned = true
		
		explosion.visible = true
		explosion.playing = true
