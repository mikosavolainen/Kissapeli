extends AnimatedSprite2D

var character_body

func _ready():
	character_body = get_parent()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		character_body.speed = 0
		play("explosion")
		await get_tree().create_timer(10).timeout
		play("default")
		character_body.speed = 1
	else:
		play("default")
