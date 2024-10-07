extends Node2D

@onready var camera: Camera2D = $"../Camera"

const SPEED: float = 16 * 4

var max_circle_radius: float = 24.0

var curr_circle_radius: float = 0.0:
	set = set_curr_circle_radius

func set_curr_circle_radius(new_radius: float) -> void:
	curr_circle_radius = new_radius
	
	queue_redraw()

func _process(delta: float) -> void:
	var input: Vector2 = Input.get_vector(
		"ui_left", "ui_right", "ui_up", "ui_down"
	)
	
	global_position += input * SPEED * delta
	
	if Input.is_action_just_pressed("ui_text_backspace"):
		var tween: Tween = create_tween()
		tween.set_ease(Tween.EASE_OUT)
		
		if curr_circle_radius < max_circle_radius:
			tween.tween_property(self, "curr_circle_radius", max_circle_radius, 0.5)
		else:
			tween.tween_property(self, "curr_circle_radius", 0.0, 0.5)

func _draw() -> void:
	if curr_circle_radius > 0.0:
		draw_circle(
			(global_position - camera.global_position),
			curr_circle_radius, Color.BLACK, false, 1, false
		)
