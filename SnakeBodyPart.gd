extends Node2D

var time_since_creation = 0
var global_pos = get_global_transform()

func _ready():
	set_pos()

func init(pos, time=0):
	global_pos = pos
	time_since_creation = time

func set_pos():
	set_global_transform(Transform2D(0.0, global_pos))

func tick(length, pos):
	set_pos()
	time_since_creation += 1
	if is_expired(length):
		reset(pos)
	print(is_expired(length), " ", length, " ", time_since_creation)

	
func reset(pos):
	global_pos = pos
	time_since_creation = 0

func is_expired(length):
	return time_since_creation >= length
