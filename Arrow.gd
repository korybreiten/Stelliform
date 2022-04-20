extends Sprite


var enemies = null
var nearest_enemy = null
var do_once = true


func _ready():
	pass


func _process(_delta):
	enemies = get_tree().get_nodes_in_group("Enemy")
	if enemies:
		nearest_enemy = enemies[0]
	global_position = Vector2(Persistence.player_track.global_position.x, Persistence.player_track.global_position.y - 75)
	
	for enemy in enemies:
		if enemy:
			if enemy.global_position.distance_to(self.global_position) < nearest_enemy.global_position.distance_to(self.global_position):
				nearest_enemy = enemy
	if enemies:
		look_at(nearest_enemy.global_position)
		
	if enemies.size() == 0:
		GlobalCamera.get_node("UI/Control/GameOver").visible = true
