extends "res://Scenes/StateMachine/baseState.gd"

func update(delta):
	if host.is_on_floor() && Input.is_action_just_pressed("jump"):
		change_state("jumping")
		return
	elif !host.is_on_floor():
		change_state("falling")
		return
	elif host.velocity == Vector2.ZERO:
		host.play_anim("idle")
	else:
		host.play_anim("walk")
	host.process_horizontal_movement(delta)
	host.process_move_and_slide(delta)
	host.apply_friction(delta)
