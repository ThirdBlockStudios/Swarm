class_name World
extends Node2D

func _input(event: InputEvent):
    if event.is_action("escape"):
        get_tree().quit()
