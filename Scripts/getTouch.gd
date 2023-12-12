extends TouchScreenButton

var animated_sprite
# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite = get_parent() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pressed:
		animated_sprite.isTouching = true
	else:
		animated_sprite.isTouching = false
