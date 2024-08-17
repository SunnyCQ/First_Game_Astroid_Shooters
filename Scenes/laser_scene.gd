extends Area2D

@export var speed : int = 800
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	#$Sprite2D.scale = Vector2(0,0)
	var tween = create_tween()
	#(Node, property, value, time)
	#essentially from the start(i.e the .from() value), 
	#the property approaches the target value over the 'time'
	tween.tween_property($Sprite2D, 'scale', Vector2(1,1), 0.2).from(Vector2(0.2,0.2))
	
func _process(delta):
	position.y -= speed * delta
