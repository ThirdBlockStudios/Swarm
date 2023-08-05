extends Area2D

@export var attack_range: CollisionShape2D


func deal_damage(attack: Attack):
    if attack_range:
        for area in get_overlapping_areas():
            if area.has_method("damage"):
                area.damage(attack)
