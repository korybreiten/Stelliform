extends Sprite

onready var button = GlobalCamera.get_node("UI/Control/RedButton")
var unlocked = 0
var user = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if user == Persistence.player_track and unlocked <= 0:
		button.visible = true

func _on_RedArea2D_body_entered(body):
	if body == Persistence.player_track:
		user = body

func _on_RedArea2D_body_exited(body):
	if body == Persistence.player_track:
		user = null
		button.visible = false
