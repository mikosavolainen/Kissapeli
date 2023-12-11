extends VBoxContainer

var btnPlay
var btnSettings
var btnQuit
# Called when the node enters the scene tree for the first time.
func _ready():
	btnPlay = get_child(0)
	btnSettings = get_child(1)
	btnQuit = get_child(2)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
