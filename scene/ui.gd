extends CanvasLayer

var health_image = load("res://Images/Screenshot 2026-03-20 134754.png")
var survival_score = 1

func set_health(health):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()


	for i in health:
		var text_rect = TextureRect.new()
		text_rect.texture = health_image
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		$MarginContainer2/HBoxContainer.add_child(text_rect)
	pass
	


func _on_survival_timer_timeout() -> void:
	Global.score += survival_score
	updating_score_screen()
	pass # Replace with function body.
	
func updating_score_screen():
	$MarginContainer/Label.text = str(Global.score)
