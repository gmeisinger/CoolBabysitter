extends "res://Scenes/StateMachine/baseState.gd"

const TERMINAL_VELOCITY = 1000

func enter():
	host.play_anim("fall")

func update(delta):
	if host.velocity.y >= TERMINAL_VELOCITY:
		change_state("death_fall")
		return
	if host.is_on_floor():
		# $host.play('landing')
		change_state("moving")
		return
	host.process_horizontal_movement(delta)
	host.process_move_and_slide(delta)
