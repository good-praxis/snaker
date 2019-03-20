extends Node2D

enum {UP, DOWN, LEFT, RIGHT}

var last_input = UP
const BLOCKSIZE = 35
var length
var body_part_scene = preload("res://SnakeBodyPart.tscn")
var body_parts = []

export var start_length = 2
export var move_interval = 2



func _ready():
	$"Move Timer".start(move_interval)
	length = start_length
	for i in range(start_length):
		var current_part = body_part_scene.instance()
		var init_pos = position
		init_pos.y = init_pos.y + ((i + 1) * 35)
		current_part.init(init_pos, i)
		$Tail.add_child(current_part)
		current_part.set_pos()
		body_parts.append(current_part)

func _process(delta):
	if Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_W):
		last_input = UP
	elif Input.is_key_pressed(KEY_DOWN) or Input.is_key_pressed(KEY_S):
		last_input = DOWN
	elif Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_A):
		last_input = LEFT
	elif Input.is_key_pressed(KEY_RIGHT) or Input.is_key_pressed(KEY_D):
		last_input = RIGHT

func _on_Move_Timer_timeout():
	update_tail()
	move()
	validate_tail()
	
func move():
	match last_input:
		UP:
			move_local_y(-BLOCKSIZE)
		DOWN:
			move_local_y(BLOCKSIZE)
		LEFT:
			move_local_x(-BLOCKSIZE)
		RIGHT:
			move_local_x(BLOCKSIZE)

func update_tail():
	for i in range(body_parts.size()):
		var this_part = body_parts[i]
		this_part.tick(length, position)
		
func validate_tail():
	for i in range(body_parts.size()):
		var this_part = body_parts[i]
		this_part.set_pos()

