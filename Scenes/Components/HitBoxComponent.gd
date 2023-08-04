class_name HitBoxComponent
extends Area2D

@export var health_component: HealthComponent

func ready():
	pass

func damage(attack: Attack):
	if health_component:
		health_component.damage(attack)
