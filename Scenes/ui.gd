extends CanvasLayer

static var ship_icon_image = load('res://kenney_space-shooter-redux/Images/UI/playerLife1_red.png')
var time_elapsed : int = 0 

func set_health(amount):
	#remove all children (ship icons)
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	
	#create new children amount is set by health
	for i in amount:
		var ship_icon = TextureRect.new()
		ship_icon.texture = ship_icon_image
		$MarginContainer2/HBoxContainer.add_child(ship_icon)
		ship_icon.stretch_mode = TextureRect.STRETCH_KEEP


func _on_score_timer_timeout():
	time_elapsed += 1
	$MarginContainer/Label.text = str(time_elapsed)
	Global.score = time_elapsed
