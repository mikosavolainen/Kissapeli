extends Sprite2D

const GRAVITY = 500
const BOUNCE_FACTOR = 0.4
const MAX_BOUNCES = 3

var velocity = Vector2()
var targetY = 102
var isFalling = true
var bounceCount = 0

func _process(delta):
	if isFalling:
		velocity.y += GRAVITY * delta
		position += velocity * delta
	
		if position.y >= targetY:
			position.y = targetY
			velocity.y *= -BOUNCE_FACTOR
			bounceCount += 1
			
			if bounceCount >= MAX_BOUNCES:
				isFalling = false
