extends TextureRect

const SPEED: float = 16

var direction: int = 1

func _process(delta: float) -> void:
	if position.x + size.x + direction * SPEED * delta > get_viewport_rect().end.x:
		direction = -1
	if position.x + direction * SPEED * delta < get_viewport_rect().position.x:
		direction = 1
	
	position.x += direction * SPEED * delta
