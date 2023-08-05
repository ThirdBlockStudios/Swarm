class_name AttackComponent
extends Area2D


@export var attack_range: CollisionShape2D
@export var ignore_teams: Array[Game.TEAMS]


func deal_damage(attack: Attack):
    if attack_range:
        for area in get_overlapping_areas():
            if area.has_method("damage") and not is_invalid_attack(area):
                area.damage(attack)


## Attack should not be allowed if target's team is set ignored. 
## Example: player team should not damage player team.
func is_invalid_attack(target: HitBoxComponent) -> bool:
    return ignore_teams.find(target.team) > -1
