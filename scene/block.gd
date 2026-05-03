extends Area2D

@export var speed_Upper_range = 200
@export var speed_lower_range = 1
@export var xShift_Upper_range = 10
@export var xShift_lower_range = -10

@export var targetS_length = 50
@export var targetS_Width = 50

@export var rotation_range = 30

@export var block_hit_score = 2

var block_speed: int = 0;
var shift_speed: int = 0;
var rotation_speed: int = 0

var texture_path = ["res://Images/block.png", "res://Images/file.png"]

signal collision

func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	var width = get_viewport().get_visible_rect().size[0]
	
	var new_width = rng.randi_range(0,width)
	var new_length = rng.randi_range(-150,-50)
	position = Vector2(new_width, new_length)
	
	block_speed = rng.randi_range(speed_lower_range,speed_Upper_range)
	shift_speed = rng.randi_range(xShift_lower_range,xShift_Upper_range)
	
	var block_type = rng.randi_range(0,texture_path.size()-1)
	print("spawning type" + str(block_type) + "block")
	var texture = load(texture_path[block_type])
	var target_size = Vector2(targetS_length, targetS_Width)
	var texture_size = texture.get_size()

	$block.texture = texture
	$block.scale = target_size / texture_size
	
	rotation_speed = rng.randi_range(0,rotation_range)
	
func _process(delta: float) -> void:
	position += Vector2(shift_speed, block_speed) * delta
	rotation_degrees += rotation_speed * delta
	pass
	
func _on_body_entered(body: Node2D) -> void:
	print(body)
	collision.emit()
	pass # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()
	Global.score += block_hit_score
	get_tree().call_group('ui', 'updating_score_screen')
	pass # Replace with function body.
