class_name World
extends Node2D

const MAP_SIZE: Vector2 = Vector2(256, 256)
const ATLAS_SIZE: Vector2 = Vector2(11, 11)
const NOISE_FREQUENCY: float = 0.04

var player: Player
var enemyBase: EnemyBase
var playerBase: PlayerBase

@onready var ui_manager = $UIManager
@onready var tilemap = $TileMap


func _ready():
    player = $Player
#    playerBase = $PlayerBase
    enemyBase = $EnemyBase
    # Hook up signals for when health reaches 0.
    # TODO(nkuang): Change GameOverScreen to Victory/Defeat Screens.
#    player.get_node("HealthComponent").health_depleted.connect(display_game_over_screen)
#    playerBase.get_node("HealthComponent").health_depleted.connect(display_game_over_screen)
    enemyBase.get_node("HealthComponent").health_depleted.connect(display_game_over_screen)
    generate_world()


func generate_world():
    var spawn = tilemap.local_to_map(Vector2(0, 0))
    var noise_generator = FastNoiseLite.new()
    noise_generator.set_noise_type(FastNoiseLite.TYPE_PERLIN)
    noise_generator.set_frequency(NOISE_FREQUENCY)
#    noise_generator.set_fractal_octaves(10)
    noise_generator.seed = randi()

    for x in MAP_SIZE.x:
        for y in MAP_SIZE.y:
            # MAP_SIZE / 2 to center the map relative to origin (0, 0).
            var coordinates = Vector2i(spawn.x - MAP_SIZE.x / 2 + x, spawn.y - MAP_SIZE.y / 2 + y)
            # The noise generator returns a value from [-1, 1]. Assuming the
            # tile atlas is square (N x N), we multiple the noise value by N to
            # span the entire atlas since the noise value maps to a specific
            # tile in the atlas.
            #
            # Note that most noise functions don't produce values close to the extrema.
#            var noise_value = (noise_generator.get_noise_2dv(coordinates)) * (ATLAS_SIZE.x / 2)
            var noise_value = (noise_generator.get_noise_2dv(coordinates)) / 2 + 0.5
            var atlas_x = 0 if (noise_value < 0.6) else 1
            var atlas_coordinates = Vector2(atlas_x, 0)
            tilemap.set_cell(0, coordinates, 2, atlas_coordinates, 0)


func _input(event: InputEvent):
    if event.is_action("escape"):
        get_tree().quit()


## Displays the game over screen after a slight 0.5s delay.
func display_game_over_screen():
    ui_manager.set_visible_component(Game.UiComponent.GAME_OVER_SCREEN, true, 0.5)
