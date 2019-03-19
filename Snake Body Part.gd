extends Node2D

var time_since_creation = 0
var global_pos = get_global_transform()

func _ready():
	pass

func init(pos):
	print("Hello world")
	global_pos = pos
	
func _process(delta):
	set_global_transform(global_pos)

