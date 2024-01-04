extends Node2D

@onready var face_sprite = $TurtleBody/TurtleFace
@onready var default_face = "res://images/turtle/faces/turtle_face_2.png"
@onready var body_parts = {
	"belly": {
		"hit spot" : false,
		"face" : "res://images/turtle/faces/turtle_face_3.png"
	},
	"face": {
		"hit spot" : false,
		"face" : "res://images/turtle/faces/turtle_face_1.png"
	},
	"giblets": {
		"hit spot" : false,
		"face" : "res://images/turtle/faces/turtle_face_4.png"
	},
	"head": {
		"hit spot" : false,
		"face" : "res://images/turtle/faces/turtle_face_5.png"
	},
	"neck": {
		"hit spot" : false,
		"face" : "res://images/turtle/faces/turtle_face_0.png"
	},
	"shell front": {
		"hit spot" : false,
		"face" : "res://images/turtle/faces/turtle_face_7.png"
	},
	"shell tip": {
		"hit spot" : false,
		"face" : "res://images/turtle/faces/turtle_face_6.png"
	}
}

var touching = false

func _ready():
	set_default_face()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		for key in body_parts:
			if body_parts[key]["hit spot"]:
				change_face(body_parts[key]["face"])
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_released():
		set_default_face()
	
	if touching and event is InputEventMouseMotion:
		print(event.velocity)
	 
func change_face(face_ref):
	touching = true
	face_sprite.texture = load(face_ref)

func set_default_face():
	touching = false
	face_sprite.texture = load(default_face)

func _on_belly_mouse_entered():
	body_parts["belly"]["hit spot"] = true

func _on_belly_mouse_exited():
	if body_parts["belly"]["hit spot"]:
		set_default_face()
	body_parts["belly"]["hit spot"] = false

func _on_face_mouse_entered():
	body_parts["face"]["hit spot"] = true

func _on_face_mouse_exited():
	if body_parts["face"]["hit spot"]:
		set_default_face()
	body_parts["face"]["hit spot"] = false

func _on_gibbles_mouse_entered():
	body_parts["giblets"]["hit spot"] = true

func _on_gibbles_mouse_exited():
	if body_parts["giblets"]["hit spot"]:
		set_default_face()
	body_parts["giblets"]["hit spot"] = false

func _on_head_mouse_entered():
	body_parts["head"]["hit spot"] = true

func _on_head_mouse_exited():
	if body_parts["head"]["hit spot"]:
		set_default_face()
	body_parts["head"]["hit spot"] = false

func _on_neck_mouse_entered():
	body_parts["neck"]["hit spot"] = true

func _on_neck_mouse_exited():
	if body_parts["neck"]["hit spot"]:
		set_default_face()
	body_parts["neck"]["hit spot"] = false

func _on_shell_front_mouse_entered():
	body_parts["shell front"]["hit spot"] = true

func _on_shell_front_mouse_exited():
	if body_parts["shell front"]["hit spot"]:
		set_default_face()
	body_parts["shell front"]["hit spot"] = false

func _on_shell_tip_mouse_entered():
	body_parts["shell tip"]["hit spot"] = true

func _on_shell_tip_mouse_exited():
	if body_parts["shell tip"]["hit spot"]:
		set_default_face()
	body_parts["shell tip"]["hit spot"] = false



