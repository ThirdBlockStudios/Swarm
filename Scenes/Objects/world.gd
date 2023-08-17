class_name World
extends Node2D

# TODO(nkuang): World should keep track of all objects that can emit a game-over
# signal i.e. Player/EnemyBases
var player = null

@onready var ui_manager = $UIManager


func _ready():
    # Hook up Player's killed signal.
    player = get_tree().get_first_node_in_group("player")
    assert(player != null)
    player.get_node("HealthComponent").health_depleted.connect(display_game_over_screen)
    # TODO(nkuang): hook up EnemyBase's/PlayerBase's killed signal.


func _input(event: InputEvent):
    if event.is_action("escape"):
        get_tree().quit()


## Displays the game over screen after a slight 0.5s delay.
func display_game_over_screen():
    ui_manager.set_visible_component(Game.UiComponent.GAME_OVER_SCREEN, true, 0.5)
