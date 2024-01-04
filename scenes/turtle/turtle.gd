extends Node2D

@onready var face_sprite = $TurtleBody/TurtleFace
@onready var default_face = "res://images/turtle/faces/turtle_face_2.png"
@onready var body_parts = {
	"belly": {
		"hit spot" : false,
		"face" : "res://images/turtle/faces/turtle_face_3.png"
	},
	"butt": {
		"hit spot" : false,
		"face" : "res://images/turtle/faces/turtle_face_8.png"
	},
	"face": {
		"hit spot" : false,
		"face" : "res://images/turtle/faces/turtle_face_1.png"
	},
	"feet back": {
		"hit spot" : false,
		"face" : "res://images/turtle/faces/turtle_face_1.png"
	},
	"feet front": {
		"hit spot" : false,
		"face" : "res://images/turtle/faces/turtle_face_5.png"
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
	"shell back": {
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
var face_original_pos = Vector2(0, 0)
var mouse_touch_pos = Vector2(0, 0)

func _ready():
	set_default_face()
	face_original_pos = face_sprite.position

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		for key in body_parts:
			if body_parts[key]["hit spot"]:
				mouse_touch_pos = get_viewport().get_mouse_position()
				change_face(body_parts[key]["face"])
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_released():
		set_default_face()
	
	if touching and event is InputEventMouseMotion:
		shake_face()
	else:
		face_sprite.position = face_original_pos

func shake_face():
	var mouse_pos = get_viewport().get_mouse_position()
	var x_offset = mouse_pos.x - mouse_touch_pos.x
	var y_offset = mouse_pos.y - mouse_touch_pos.y
	face_sprite.position = Vector2(face_original_pos.x + x_offset, face_original_pos.y + y_offset)

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

func _on_butt_mouse_entered():
	body_parts["butt"]["hit spot"] = true

func _on_butt_mouse_exited():
	if body_parts["butt"]["hit spot"]:
		set_default_face()
	body_parts["butt"]["hit spot"] = false

func _on_face_mouse_entered():
	body_parts["face"]["hit spot"] = true

func _on_face_mouse_exited():
	if body_parts["face"]["hit spot"]:
		set_default_face()
	body_parts["face"]["hit spot"] = false

func _on_feet_back_mouse_entered():
	body_parts["feet back"]["hit spot"] = true

func _on_feet_back_mouse_exited():
	if body_parts["feet back"]["hit spot"]:
		set_default_face()
	body_parts["feet back"]["hit spot"] = false

func _on_feet_front_mouse_entered():
	body_parts["feet front"]["hit spot"] = true

func _on_feet_front_mouse_exited():
	if body_parts["feet front"]["hit spot"]:
		set_default_face()
	body_parts["feet front"]["hit spot"] = false

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

func _on_shell_back_mouse_entered():
	body_parts["shell back"]["hit spot"] = true

func _on_shell_back_mouse_exited():
	if body_parts["shell back"]["hit spot"]:
		set_default_face()
	body_parts["shell back"]["hit spot"] = false

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




