extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if button_pressed:
		var scene_tree = get_tree()
		scene_tree.change_scene_to_file("res://Scenes/menu.tscn")
