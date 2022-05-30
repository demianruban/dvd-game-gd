extends KinematicBody2D

export (int) var speed = 50

var velocity = Vector2(1, 1)
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var collision = move_and_collide(velocity * delta * speed)
	if collision:
		var reflect = collision.remainder.bounce(collision.normal)
		velocity = velocity.bounce(collision.normal)
		move_and_collide(reflect)
		
#	if self.position.x > screen_size.x - self.transform.size:
#		velocity.x = -speed
#	elif self.position.x < 0:
#		velocity.x = speed
#	if self.position.y > screen_size.y:
#		velocity.y = -speed
#	elif self.position.y < 0:
#		velocity.y = speed	
#
#	self.position += velocity * delta
