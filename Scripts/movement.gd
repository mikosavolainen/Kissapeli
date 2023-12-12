extends CharacterBody2D
var screenSize: Vector2
@export var speed = 400
var freeze = false
var target = position
var randomPoint: Vector2
var nextPosition: Vector2
var animatedSprite
var getNewDir = false

func _ready():
	animatedSprite = get_child(2)
	screenSize = get_viewport_rect().size
	lookAtRandomPoint()
	randomize()

func get_random_point() -> Vector2:
	var x: float = randi_range(0, screenSize.x)
	var y: float = randi_range(0, screenSize.y)
	return Vector2(x, y)
	

func lookAtRandomPoint():
	speed = randf_range(300, 500)
	animatedSprite.speed_scale = speed / 300
	randomPoint = get_random_point()
	look_at(randomPoint) 
	rotation_degrees -= 20

func _physics_process(delta):
	if freeze:
		return
	if getNewDir:
		lookAtRandomPoint()
		getNewDir = false
	velocity = position.direction_to(randomPoint) * speed
	# look_at(target)
	if position.distance_to(randomPoint) > 10:
		move_and_slide()
	else:
		lookAtRandomPoint()
		if position.distance_to(randomPoint) < 100:
			lookAtRandomPoint()
