extends Area2D

export (int) var speed = 200

var target
var velocity = Vector2(1,1)

func _ready():
	pass
	#print(get_tree().root)
	#DVD.connect("player_dies", self, "death")# Replace with function body.
	
func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()

func _process(delta):
	if target:
		
		velocity = position.direction_to(target) * speed
		
		if position.distance_to(target) > 5:
			position += velocity * delta

func death():
	hide()
	$CollisionShape2D.disabled = true

func _on_Player_body_entered(body):
	death() # Replace with function body.
