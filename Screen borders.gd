extends StaticBody2D

onready var screen_size = get_viewport_rect().size
var new_coll_shape
# Called when the node enters the scene tree for the first time.
func _ready():
	prints("Screen size: ", screen_size)
	prints("x: ", screen_size.x)
	
	# horizontal segment on top
	new_coll_shape = CollisionShape2D.new()
	new_coll_shape.shape = SegmentShape2D.new()
	new_coll_shape.shape.a = Vector2(0, 0)
	new_coll_shape.shape.b = Vector2(screen_size.x, 0)
	
	self.add_child(new_coll_shape)
	
	# horizontal segment on bottom
	new_coll_shape = CollisionShape2D.new()
	new_coll_shape.shape = SegmentShape2D.new()
	new_coll_shape.shape.a = Vector2(0, screen_size.y)
	new_coll_shape.shape.b = Vector2(screen_size.x, screen_size.y)
	
	self.add_child(new_coll_shape)
	
	# vertical segment on the left
	new_coll_shape = CollisionShape2D.new()
	new_coll_shape.shape = SegmentShape2D.new()
	new_coll_shape.shape.a = Vector2(0, 0)
	new_coll_shape.shape.b = Vector2(0, screen_size.y)
	
	self.add_child(new_coll_shape)
	
	# vertical segment on the right
	new_coll_shape = CollisionShape2D.new()
	new_coll_shape.shape = SegmentShape2D.new()
	new_coll_shape.shape.a = Vector2(screen_size.x, 0)
	new_coll_shape.shape.b = Vector2(screen_size.x, screen_size.y)
	
	self.add_child(new_coll_shape)

	prints("Nodes", self.get_children())
