extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	if Persistence.start_ship == 1:
		GlobalCamera.get_node("UI/Control/Race").set_texture(load("res://Art/Races/Race1/Race1.png"))
	if Persistence.start_ship == 2:
		GlobalCamera.get_node("UI/Control/Race").set_texture(load("res://Art/Races/Race2/Race2.png"))
	if Persistence.start_ship == 3:
		GlobalCamera.get_node("UI/Control/Race").set_texture(load("res://Art/Races/Race3/Race3.png"))
	if Persistence.start_ship == 4:
		GlobalCamera.get_node("UI/Control/Race").set_texture(load("res://Art/Races/Race4/Race4.png"))
	if Persistence.start_ship == 5:
		GlobalCamera.get_node("UI/Control/Race").set_texture(load("res://Art/Races/Race5/Race5.png"))
	if Persistence.start_ship == 6:
		GlobalCamera.get_node("UI/Control/Race").set_texture(load("res://Art/Races/Race6/Race6.png"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
