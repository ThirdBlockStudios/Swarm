class_name HitBoxComponent
extends Area2D

@export var health_component: HealthComponent
@export var team: Game.TEAMS = Game.TEAMS.neutral

func damage(attack: Attack):
    if health_component:
        health_component.damage(attack)
