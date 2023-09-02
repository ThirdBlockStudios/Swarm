class_name Player
extends CharacterBody2D

@export var movement_speed = 400
@export var speed_factor_increase = 2


func get_input():
    return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()


func _physics_process(delta: float):
    # Add stamina to the sprint
    var speed_factor = 1
    if Input.is_action_pressed("shift"):
        speed_factor = speed_factor_increase

    var input: Vector2 = get_input()
    if input:
        velocity = input * movement_speed * speed_factor
        velocity = velocity.limit_length(movement_speed * speed_factor)
        move_and_slide()
    # TODO(nkuang): if no input, implement friction (if needed).


func _input(event: InputEvent):
    # TODO(nkuang): Testing only. Remove after enemy damage implemented.
    if Input.is_action_pressed("kill_player_test"):
        # Simulate 1HKO on Player.
        var attack = Attack.new()
        attack.attack_damage = 50
        $HealthComponent.damage(attack)
    if event.is_action_pressed("attack"):
        $AnimatedSprite2D.stop()
        $AnimatedSprite2D.play("Attack")
        var attack = Attack.new()
        attack.attack_damage = 10
        $AttackComponent.deal_damage(attack)


func _on_animated_sprite_2d_animation_finished():
    $AnimatedSprite2D.play("Static")
