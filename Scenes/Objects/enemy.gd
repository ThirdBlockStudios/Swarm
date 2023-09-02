class_name Enemy
extends Node2D

var velocity := Vector2(0, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
    position += velocity * delta

func _ready():
    $HealthComponent.health_decreased.connect(play_damaged_animation)

func play_damaged_animation():
    $AnimatedSprite2D.play("Damaged")
