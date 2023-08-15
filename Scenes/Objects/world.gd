class_name World
extends Node2D

# TODO(nkuang): World should keep track of all objects that can emit a game-over
# signal i.e. Player/EnemyBases
var player = null

@onready var game_over_screen = $UILayer/GameOver

func _ready():
    # Hook up Player's killed signal.
    player = get_tree().get_first_node_in_group("player")
    assert(player != null)
    player.killed.connect(display_game_over_screen)
    # TODO(nkuang): hook up EnemyBase's killed signal.


func _input(event: InputEvent):
    if event.is_action("escape"):
        get_tree().quit()


## Displays the game over screen after a slight delay.
func display_game_over_screen():
    await get_tree().create_timer(0.5).timeout
    game_over_screen.visible = true
