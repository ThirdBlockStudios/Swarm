class_name EnemyBase
extends Node2D


@export var enemy_scene: PackedScene


func _on_spawn_timer_timeout():
    var enemy = enemy_scene.instantiate()
    add_child(enemy)
