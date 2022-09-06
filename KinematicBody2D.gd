extends KinematicBody2D

const UP = Vector2(0,-1)
const MAXFALLSPEED = 200
const MAXSPEED = 200
const ACCEL = 80
var motion = Vector2()

func _physics_process(_delta):
	
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	motion.x = clamp(motion.x, -MAXSPEED,MAXSPEED)
	motion.y = clamp(motion.y, -MAXSPEED,MAXSPEED)
	
	if Input. is_action_pressed("right"):
		motion.x += ACCEL
	elif Input. is_action_pressed("left"):
		motion.x -= ACCEL
	else:
		motion.x = lerp(motion.x,0,0.2)
	if Input. is_action_pressed("down"):
		motion.y += ACCEL
	elif Input. is_action_pressed("jump"):
		motion.y -= ACCEL
	else:
		motion.y = lerp(motion.y,0,0.2)
	
	motion = move_and_slide(motion,UP)
