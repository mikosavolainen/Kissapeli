extends Node2D



func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			# Mouse button is pressed
			if event.button_index ==  MOUSE_BUTTON_LEFT:  # Check if it's the left mouse b
				var startpos = Vector2(randf_range(1,1150), randf_range(1,650))
				var sprite2D = self
				var mouse_pos = event.position
				if sprite2D != null and sprite2D.get_rect().has_point(sprite2D.to_local(mouse_pos)):
					var parent = get_parent()
					if parent:
						parent.position = startpos
