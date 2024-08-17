extends Area2D

@export var speed_max := 500
@export var speed_min := 200
@export var rot_speed_max := 10
@export var rot_speed_min := 1
signal collision

var speed
var dir_x
var rot_speed

func _ready():
	var rng := RandomNumberGenerator.new()
	
	#texture
	var path: String = "res://kenney_space-shooter-redux/Images/Meteors/meteorBrown_big" + str(rng.randi_range(1,4)) + ".png"
	$Sprite2D.texture = load(path)
	
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	
	speed = rng.randi_range(speed_min, speed_max)
	dir_x = rng.randf_range(-1, 1)
	rot_speed = rng.randi_range(rot_speed_max, rot_speed_min)
	position = Vector2(random_x, random_y)
	

func _process(delta):
	position += Vector2(dir_x, 1.0) * speed * delta 
	rotation += rot_speed * delta 
	
func _on_body_entered(_body):#triggers when body entered
	collision.emit()
	
func _on_area_entered(area):
	print("whatf")
	area.queue_free()
	queue_free()
