extends Control

@export var level_scene: PackedScene = load("res://Scenes/level.tscn")

func _ready():
	$MarginContainer2/VBoxContainer/Label.text = "Score: " + str(Global.score)

func _input(event):
	if event.is_action_pressed("Respawn"):
		get_tree().change_scene_to_packed(level_scene)
