extends Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	wait_time = 0.1
	autostart = true

func _on_timeout():
	print("meteor")
