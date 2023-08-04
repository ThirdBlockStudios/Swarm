extends Node2D

@export var movement_speed = 125
func _process(delta: float):
	

	var direction = Vector2.ZERO
	var speed_factor = 1
	if Input.is_action_pressed("ui_left"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		direction += Vector2.RIGHT
	if Input.is_action_pressed("ui_down"):
		direction += Vector2.DOWN
	if Input.is_action_pressed("ui_up"):
		direction += Vector2.UP
	if Input.is_action_pressed("shift"):
		speed_factor = 2

	if direction != Vector2.ZERO:
		direction = direction.normalized()
		position += direction * movement_speed * speed_factor * delta
