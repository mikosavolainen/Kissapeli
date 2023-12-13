extends AnimatedSprite2D

var character_body
var audioplayer
var exploded = false
var mousePos
var isTouching
var hitbox = 70
var onlyMobile = false
var spawnPoint1: Vector2
var spawnPoint2: Vector2
var spawnPoint3: Vector2
var spawnPoint4: Vector2

func _ready():
	spawnPoint1 = Vector2(-200, -200)
	spawnPoint2 = Vector2(1200, -200)
	spawnPoint3 = Vector2(1200, 900)
	spawnPoint4 = Vector2(-200, 900)
	play("default")
	#Gets the parent move to move it from this script
	character_body = get_parent()
	#Gets the AudioStreamPlayer node to play sound from this script
	audioplayer = get_child(0)
	
func _input(event):
	if onlyMobile == false:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed and exploded == false and isTouching == true:
			_on_touch_screen_button_pressed()
#This function is called every frame
func _physics_process(delta):
	if exploded == false:
		play("default")
	mousePos = get_viewport().get_mouse_position()
	if mousePos.x < character_body.position.x + hitbox and mousePos.x > character_body.position.x - hitbox and mousePos.y < character_body.position.y + hitbox and mousePos.y > character_body.position.y - hitbox:
		isTouching = true
	else:
		isTouching = false

func randomSpawnPoint():
	var num = randi_range(1, 4)
	if num == 1:
		return spawnPoint1
	elif num == 2:
		return spawnPoint2
	elif num == 3:
		return spawnPoint3
	elif num == 4:
		return spawnPoint4
		
func _on_touch_screen_button_pressed():
	exploded = true
	character_body.freeze = true
	play("explosion")
	audioplayer.play()
	character_body.getNewDir = true
	await get_tree().create_timer(1).timeout
	character_body.position = randomSpawnPoint()
	play("default")
	character_body.freeze = false
	exploded = false
