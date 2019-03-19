extends Area2D

enum {UP, DOWN, LEFT, RIGHT}

var last_input = UP
const BLOCKSIZE = 35
var length = 0

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
	move()
	
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

