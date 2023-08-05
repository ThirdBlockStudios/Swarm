class_name CameraComponent
extends Camera2D

@export var pan_speed: float = 400
@export var pannable := true
@export var locked := true

# Camera Variables
var zoom_speed = 0.1
var panning = false


func _process(delta: float):
    if not locked:
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
            speed_factor = 3

        if direction != Vector2.ZERO:
            direction = direction.normalized()
            offset += direction * pan_speed * speed_factor * delta


func _input(event: InputEvent):
    if event.is_action_pressed("center_camera"):
        offset = Vector2(0, 0)
        position = get_tree().get_first_node_in_group("player").position
    if event.is_action_released("zoom_in"):
        zoom_camera(-zoom_speed, event.position)
    if event.is_action_released("zoom_out"):
        zoom_camera(zoom_speed, event.position)
    if pannable:
        if event.is_action_pressed("pan_with_mouse"):
            panning = true
        elif event.is_action_released("pan_with_mouse"):
            panning = false
        if event is InputEventMouseMotion and panning == true:
            offset -= event.relative / zoom


func zoom_camera(zoom_factor, mouse_position):
    var viewport_size = get_viewport().size
    var previous_zoom = zoom
    zoom += zoom * zoom_factor
