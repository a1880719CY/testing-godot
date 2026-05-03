extends Control


@export var level_scene: PackedScene

func _ready() -> void:
	$CenterWord/VBoxContainer/Label2.text = "Your score: " + str(Global.score)
	Global.score = 0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("restart_game"):
		get_tree().change_scene_to_packed(level_scene)
	
