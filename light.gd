extends PointLight2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	energy == randf_range(0.3, 1)
	texture_scale == randf_range(0.1, 0.3)
