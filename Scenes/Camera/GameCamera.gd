extends Camera2D

const SPEED = 50.0

func _physics_process(delta):
	position.x += SPEED * delta
