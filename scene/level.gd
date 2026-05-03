extends Node2D


var block_scene: PackedScene = load("res://scene/block.tscn")
var laser_scene: PackedScene = load("res://scene/laser.tscn")

var health: int = 4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().call_group('ui', 'set_health', health)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var block = block_scene.instantiate()
	$Block.add_child(block)
	block.connect('collision', _on_block_collision)
	pass # Replace with function body.
	
func _on_block_collision():
	health -= 1
	get_tree().call_group('ui', 'set_health', health)
	if health <= 0:
		get_tree().change_scene_to_file("res://scene/game_over_screen.tscn")


func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Laser.add_child(laser)
	laser.position = pos
	print("shoot laser" + str(pos))
	pass # Replace with function body.
