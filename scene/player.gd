extends CharacterBody2D

@export var speed = 500
@export var cdTime: float = 0.5
var able_shoot:bool = true;

signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var movement = Input.get_vector("left", "right", "up", "down")
	velocity = movement * speed
	move_and_slide()
	if Input.is_action_pressed("left_click"):
		var newPosition = get_global_mouse_position()
		position = newPosition
	if Input.is_action_just_pressed("shoot") and able_shoot:
		able_shoot = false
		$gunCD.start(cdTime)
		laser.emit($laserStartPosition.global_position)
	pass
	


func _on_gun_cd_timeout() -> void:
	able_shoot = true
	pass # Replace with function body.
