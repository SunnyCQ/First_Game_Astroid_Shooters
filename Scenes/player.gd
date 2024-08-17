extends CharacterBody2D

#@export makes this variable visible in the 2D/3D viewing area, making it easier to change on the fly
#the ": TYPE=" allows us to specify the type. this interface is fucking crazy though
#doing ":=" alone will automatically set the type as the type of the data it is first set as.
#so, if speed was initially assigned to 200, it will be automatically set as int. 
#@export var speed: int = 600 
@export var speed := 600
var laser_ready : bool = true

signal laser(pos) #creates a signal with parameters pos

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(100,100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#must put in this order. going from left to right the args are (-1,0),(1,0),(0,-1),(0,1)
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide() #automatically applies velocity. Velocity is special variable
	
	#shoot input.
	#is_action_just_pressed means you shoot every press. Holding it down makes no difference.
	if Input.is_action_just_pressed("Shoot") and laser_ready:
		laser.emit($LaserStartPos.global_position)#where node is actually in scene tree.
		laser_ready = false
		$LaserTimer.wait_time = 0.3
	
func _on_laser_timer_timeout():
	laser_ready = true
