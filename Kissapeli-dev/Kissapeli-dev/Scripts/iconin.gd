extends CharacterBody2D

var screen_size: Vector2
var speed: float = 100
var direction: Vector2
var move_time: float = 1.0
var time_passed: float = 0.0
var edge_margin: float = 50  # Distance from the edge at which to change direction

var collision_shape: CollisionShape2D

func _ready():
	screen_size = get_viewport().size
	randomize_direction()
	
	# Assuming the CollisionShape2D node is named "CollisionShape2D"
	collision_shape = $CollisionShape2D

func _process(delta: float):
	time_passed += delta
	if time_passed > move_time or is_moving_towards_edge():
		randomize_direction()

	position += direction * speed * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func randomize_direction():
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	# Ensure that direction is not zero
	if direction.length() == 0:
		direction = Vector2(1, 0)
	time_passed = 0
	speed = randf_range(100, 500)
	move_time = randf_range(0.1, 2.0)

func is_moving_towards_edge() -> bool:
	var future_position = position + direction * speed * 0.1
	var close_to_horizontal_edge = (future_position.x < edge_margin or future_position.x > screen_size.x - edge_margin) and direction.x != 0
	var close_to_vertical_edge = (future_position.y < edge_margin or future_position.y > screen_size.y - edge_margin) and direction.y != 0
	
	return close_to_horizontal_edge or close_to_vertical_edge

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if collision_shape.get_viewport_rect().has_point(to_local(event.position)):
			var startpos = Vector2(randf_range(1, 1150), randf_range(1, 650))
			self.position = startpos
