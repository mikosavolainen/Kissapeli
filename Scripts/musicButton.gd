extends Button
var musicplayer
var icon_off
# Called when the node enters the scene tree for the first time.
func _ready():
	musicplayer = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.music == false:
		musicplayer.volume_db = -80
		icon = ResourceLoader.load("res://Textures/musicoff.png")
	else:
		musicplayer.volume_db = 0
		icon = ResourceLoader.load("res://Textures/musicon.png")

		
