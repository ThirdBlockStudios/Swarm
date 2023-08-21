class_name UIManager
extends CanvasLayer

var ui_component_dict: Dictionary = {}


func _ready():
    create_ui_component_dict()


## Creates the UI component Enum<->Node mapping.
func create_ui_component_dict():
    # Add new UI components to the dictionary here.
    ui_component_dict[Game.UiComponent.GAME_OVER_SCREEN] = $GameOverScreen


## Sets the visibility of a UI component. Maybe add timeout later?
func set_visible_component(ui_component: Game.UiComponent, is_visible: bool, pre_delay: float):
    assert(pre_delay >= 0)
    await get_tree().create_timer(pre_delay).timeout
    ui_component_dict[ui_component].visible = is_visible
