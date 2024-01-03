extends Node2D

@onready var face_sprite = $TurtleBody/TurtleFace
@onready var default_face = "res://images/turtle/faces/turtle_face_2.png"
@onready var body_parts = {
	"belly": {
		"hit spot" : false,
		"face" : "res://images/turtle/faces/turtle_face_0.png"
	},
	"giblets": {
		"hit spot" : false,
		"face" : "res://images/turtle/faces/turtle_face_4.png"
	}
}

func _ready():
	set_default_face()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		for key in body_parts:
			if body_parts[key]["hit spot"]:
				change_face(body_parts[key]["face"])
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_released():
		set_default_face()

func change_face(face_ref):
	face_sprite.texture = load(face_ref)

func set_default_face():
	face_sprite.texture = load(default_face)

func _on_belly_mouse_entered():
	body_parts["belly"]["hit spot"] = true

func _on_gibbles_mouse_entered():
	body_parts["giblets"]["hit spot"] = true

func _on_belly_mouse_exited():
	body_parts["belly"]["hit spot"] = false

func _on_gibbles_mouse_exited():
	body_parts["giblets"]["hit spot"] = false

