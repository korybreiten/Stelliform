extends Control

var radius = 1.0
var color = Color.white

func _init(_radius, _color):
	self.radius = radius
	self.color = color

#func _set_radius(value:float):
#	radius = value
#	update()
#
#func _set_color(value:Color):
#	color = value
#	update()

func _draw():
	draw_circle(Vector2.ZERO, radius, color)
