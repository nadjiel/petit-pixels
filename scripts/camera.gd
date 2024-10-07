extends Camera2D

func _process(delta: float) -> void:
	var tween: Tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	
	if Input.is_action_just_pressed("ui_accept"):
		tween.tween_property(self, "zoom", Vector2(2, 2), 0.5)
	if Input.is_action_just_pressed("ui_cancel"):
		tween.tween_property(self, "zoom", Vector2(0.5, 0.5), 0.5)
