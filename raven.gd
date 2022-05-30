extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const UP = Vector2(0,-1)
const GRAVITY = 40
const MAXFALLSPEED = 200
const MAXSPEED = 13700
const SPEED = 430
const ACCELERATION = 300
const SPEEDCHANGE = 130
const JUMPFORCE = 1300

var motion = Vector2()
var speed = SPEED

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	motion.x = speed
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	if Input.is_action_pressed("accelerate"):
		motion.x += ACCELERATION 
	elif Input.is_action_pressed("brake"):
		motion.x -= ACCELERATION
	else:
		motion.x = lerp(motion.x, SPEED, 0.2)
	speed = motion.x
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
	
	motion = move_and_slide(motion,UP)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if $music.playing == false:
		$music.play()
	
	pass
