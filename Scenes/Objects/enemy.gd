class_name Enemy
extends Node2D

var velocity := Vector2(0, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
    position += velocity * delta
