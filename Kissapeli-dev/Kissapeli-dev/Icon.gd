extends AnimatedSprite2D

signal clicked

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if getCurrentFrameRect().has_point(to_local(event.global_position)):
			emit_signal("clicked")

func getCurrentFrameRect() -> Rect2:
	var size = frames.get_frame(animation, frame).get_size()
	var pos = offset
	if centered:
		pos -= 0.5 * size
	return Rect2(pos, size)
