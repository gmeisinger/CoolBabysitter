extends "res://Scenes/StateMachine/baseState.gd"

func enter():
	host.play_sound('hit')
	host.play_anim("hit")


func update(delta):
	if not host.get_node('AnimationPlayer').is_playing() and host.is_on_floor():
		change_state("death")
		return
	host.process_move_and_slide(delta)
