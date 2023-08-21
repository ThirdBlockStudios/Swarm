class_name World
extends Node2D

var player: Player
var enemyBase: EnemyBase
var playerBase: PlayerBase

@onready var ui_manager = $UIManager


func _ready():
    player = $Player
    playerBase = $PlayerBase
    enemyBase = $EnemyBase
    # Hook up signals for when health reaches 0.
    player.get_node("HealthComponent").health_depleted.connect(display_game_over_screen)
    playerBase.get_node("HealthComponent").health_depleted.connect(display_game_over_screen)
    enemyBase.get_node("HealthComponent").health_depleted.connect(display_game_over_screen)


func _input(event: InputEvent):
    if event.is_action("escape"):
        get_tree().quit()


## Displays the game over screen after a slight 0.5s delay.
func display_game_over_screen():
    ui_manager.set_visible_component(Game.UiComponent.GAME_OVER_SCREEN, true, 0.5)
