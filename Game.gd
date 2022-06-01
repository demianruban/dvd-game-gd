extends Node2D

var score = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$GameTimer.start()

func update_score():
	score += 1
	$Score/Label.text = "Score: " + str(score)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GameTimer_timeout():
	update_score()
	$DVD.speed += 10
	$Player.speed += 3
