extends AnimatedSprite2D

var audioplayer
var exploded = false
var mousePos
var isTouching
var hitbox = 70
var playIcon

func _ready():

	#Gets the AudioStreamPlayer node to play sound from this script
	audioplayer = get_child(0)
	playIcon = get_child(1)
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed and exploded == false and isTouching == true:
		exploded = true
		play("explosion")
		audioplayer.play()
		playIcon.visible = false
		#Waits 1 second
		await get_tree().create_timer(1).timeout
		#Starts the default animation and makes the character able to move again
		var scene_tree = get_tree()
		scene_tree.change_scene_to_file("res://Scenes/node_2d.tscn")
		play("default")
		exploded = false
	elif exploded == false:
		play("default")

#This function is called every frame
func _physics_process(delta):
	#Storing mouse position to variable
	mousePos = get_viewport().get_mouse_position()
	#Checks if mouse is touchin the sprite
	if mousePos.x < position.x + hitbox and mousePos.x > position.x - hitbox and mousePos.y < position.y + hitbox and mousePos.y > position.y - hitbox:
		isTouching = true
	else:
		isTouching = false
