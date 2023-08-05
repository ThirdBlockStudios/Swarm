extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    $HealthLabel.set_text(str($HealthComponent.health))
