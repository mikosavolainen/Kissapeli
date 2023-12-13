extends Sprite2D
const GRAVITY = 600
const BOUNCE_FACTOR = 0.4
const MAX_BOUNCES = 3
var audioplayer
var audiopitch = 1
var velocity = Vector2()
var targetY = 180
var isFalling = true
var bounceCount = 0


func _ready():
	audioplayer = get_child(0)
	

func _process(delta):
	audioplayer.pitch_scale = audiopitch
	if isFalling:
		velocity.y += GRAVITY * delta
		position += velocity * delta
	
		if position.y >= targetY:
			position.y = targetY
			audioplayer.play(0)
			audiopitch -= 0.1
			velocity.y *= -BOUNCE_FACTOR
			bounceCount += 1
			
			if bounceCount >= MAX_BOUNCES:
				isFalling = false
