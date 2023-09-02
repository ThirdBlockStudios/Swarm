class_name Player
extends Node2D

@export var movement_speed = 500
@export var speed_factor_increase = 2


func _process(delta: float):
    #ad stamina to the sprint
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
        speed_factor = speed_factor_increase

    if direction != Vector2.ZERO:
        direction = direction.normalized()
        position += direction * movement_speed * speed_factor * delta


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
