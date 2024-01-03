class_name Touchable extends Area2D

var hit_the_spot: bool = false

func _ready():
	pass # Replace with function body.

func _input(event):
	if hit_the_spot and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			print("HITTING THE SPOT")

func _mouse_enter():
	print("mouse entered")
	hit_the_spot = true

func _mouse_exit():
	print("mouse exit")
	hit_the_spot = false

