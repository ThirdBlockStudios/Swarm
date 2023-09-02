class_name HealthComponent
extends Node2D

@export var MAX_HEALTH: float = 100
var health: float

# Emitted when health reaches 0.
signal health_decreased
signal health_depleted


func _ready():
    health = MAX_HEALTH
    on_health_changed()


func damage(attack: Attack):
    health -= attack.attack_damage
    health_decreased.emit()
    on_health_changed()
    if health <= 0:
        health_depleted.emit()
        get_parent().queue_free()


func on_health_changed():
    $HealthLabel.set_text(str(health))
