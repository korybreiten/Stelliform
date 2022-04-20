extends Camera2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _process(_delta):
	
	
	if Input.is_action_just_pressed("pause") and Persistence.player_track:
		$UI/Control/OrangeButton.visible = false
		$UI/Control/BlueButton.visible = false
		$UI/Control/GreenButton.visible = false
		$UI/Control/PurpleButton.visible = false
		$UI/Control/YellowButton.visible = false
		$UI/Control/RedButton.visible = false
		$UI/Control/GameOver.visible = false
		get_tree().paused = true
		$UI/Control/PauseMenu.show()
		$UI/Control/PauseMenu/ColorRect/ResumeButton.grab_focus()
		
	
	if $UI/Control/OrangeButton.visible:
		$UI/Control/OrangeButton.grab_focus()

	if $UI/Control/BlueButton.visible:
		$UI/Control/BlueButton.grab_focus()
		
	if $UI/Control/GreenButton.visible:
		$UI/Control/GreenButton.grab_focus()
		
	if $UI/Control/PurpleButton.visible:
		$UI/Control/PurpleButton.grab_focus()
		
	if $UI/Control/RedButton.visible:
		$UI/Control/RedButton.grab_focus()

	if $UI/Control/YellowButton.visible:
		$UI/Control/YellowButton.grab_focus()


func _on_OrangeButton_pressed():
	Persistence.player_pos = Persistence.player_track.global_position
	get_tree().change_scene("res://Planets/Shops/OrangeShop.tscn")


func _on_BlueButton_pressed():
	Persistence.player_pos = Persistence.player_track.global_position
	get_tree().change_scene("res://Planets/Shops/OrangeShop.tscn")


func _on_GreenButton_pressed():
	Persistence.player_pos = Persistence.player_track.global_position
	get_tree().change_scene("res://Planets/Shops/OrangeShop.tscn")


func _on_PurpleButton_pressed():
	Persistence.player_pos = Persistence.player_track.global_position
	get_tree().change_scene("res://Planets/Shops/OrangeShop.tscn")


func _on_YellowButton_pressed():
	Persistence.player_pos = Persistence.player_track.global_position
	get_tree().change_scene("res://Planets/Shops/OrangeShop.tscn")


func _on_RedButton_pressed():
	Persistence.player_pos = Persistence.player_track.global_position
	get_tree().change_scene("res://Planets/Shops/OrangeShop.tscn")


func _on_ResumeButton_pressed():
	$UI/Control/PauseMenu.hide()
	get_tree().paused = false


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_MenuButton_pressed():
	$UI/Control/PauseMenu.hide()
	get_tree().paused = false
	get_tree().change_scene("res://MainMenu/MainMenu.tscn")
