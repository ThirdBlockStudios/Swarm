class_name GameOver
extends Control


## Restarts the game by reloading the entire tree.
func _on_play_again_button_pressed():
    # Reload the current scene when play again button pressed.
    get_tree().reload_current_scene()
