extends Area2D

export (int) var speed = 200

var target
var velocity = Vector2(1,1)
onready var _animation_player = $AnimationPlayer

enum State {
	Moving,
	Idle
}

var current_state = State.Idle

func _ready():
	pass
	#print(get_tree().root)
	#DVD.connect("player_dies", self, "death")# Replace with function body.
	
func _input(event):
	# TODO make it more reusable
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()
		current_state = State.Moving
	elif event is InputEventScreenTouch:
		target = event.position
		current_state = State.Moving
		
func _process(delta):
	match (current_state):
		State.Moving:
			_animation_player.play("Moving")
			
			velocity = position.direction_to(target) * speed
			
			if position.distance_to(target) > 5:
				position += velocity * delta
			else:
				current_state = State.Idle
		State.Idle:
			_animation_player.play("Standing")

func death():
	hide()
	$CollisionShape2D.disabled = true

func _on_Player_body_entered(body):
	death() # Replace with function body.
