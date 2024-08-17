extends Node2D

#1. load the scene. this is the blueprint
var meteor_scene: PackedScene = load("res://Scenes/meteor_scene.tscn")
var laser_scene: PackedScene = load("res://Scenes/laser_scene.tscn")

var health : int = 5

var laser_ready : bool = true

func _ready():
	var size := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()

	for star in $Stars.get_children():
		star.position = Vector2(rng.randi_range(0,int(size.x)), rng.randi_range(0, int(size.y)))
		var rand_scale = rng.randf_range(0.5,2)
		star.scale = Vector2(rand_scale,rand_scale)
		star.speed_scale = rng.randf_range(0.5,1.5)
		
	get_tree().call_group('ui', 'set_health', health)
	

func _on_meteor_timer_timeout():
	#2. create an instance
	var meteor = meteor_scene.instantiate()
	
	#3. attach the node to the scene tree
	$Meteors.add_child(meteor)
	
	#connect the signal
	meteor.connect('collision', _on_meteor_collision)

func _on_meteor_collision():
	health -= 1
	get_tree().call_group('ui', 'set_health', health)
	if health <= 0:
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/game_over.tscn")

func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos #set laser position to pos
	

		#health = 5
		#get_tree().change_scene_to_file("res://Scenes/level.tscn")

