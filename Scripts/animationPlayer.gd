extends AnimatedSprite2D

var character_body
var audioplayer
var exploded = false
var mousePos
var isTouching
var hitbox = 70

func _ready():
	play("default")
	#Gets the parent move to move it from this script
	character_body = get_parent()
	#Gets the AudioStreamPlayer node to play sound from this script
	audioplayer = get_child(0)
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed and exploded == false and isTouching == true:
		exploded = true
		#Freezes the character
		character_body.freeze = true
		#Plays sound and animation
		play("explosion")
		audioplayer.play()
		#Waits 1 second
		await get_tree().create_timer(1).timeout
		#Spawns the parent node to random position
		character_body.position.x = randf_range(0, 1152)
		character_body.position.y = randf_range(0, 648)
		#Starts the default animation and makes the character able to move again
		play("default")
		character_body.freeze = false
		exploded = false
	elif exploded == false:
		play("default")

#This function is called every frame
func _physics_process(delta):
	#Storing mouse position to variable
	mousePos = get_viewport().get_mouse_position()
	#Checks if mouse is touchin the sprite
	if mousePos.x < character_body.position.x + hitbox and mousePos.x > character_body.position.x - hitbox and mousePos.y < character_body.position.y + hitbox and mousePos.y > character_body.position.y - hitbox:
		isTouching = true
	else:
		isTouching = false
