extends "res://Scenes/StateMachine/baseState.gd"

func enter():
	host.play_anim("death_fall")

func update(delta):
	if host.is_on_floor():
		host.play_sound('hit')
		change_state("death")
		return
	
	# don't process input once in death fall state?
	#host.process_horizontal_movement(delta)
	host.process_move_and_slide(delta)
