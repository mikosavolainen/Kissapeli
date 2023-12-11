extends Button


func _on_Button_pressed():
	var scene_tree = get_tree()
	scene_tree.change_scene("res://Scenes/node_2d.tscn")
