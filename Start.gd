extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var control = GlobalCamera.get_node("UI/Control")

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalCamera.current = false
	control.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause") or Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://MainMenu/MainMenu.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://MainMenu/MainMenu.tscn")
