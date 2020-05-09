extends "res://Scenes/StateMachine/baseState.gd"

# should it just be one state? Death and respawn? Or wait for input

func enter():
	#host.die()
	host.play_anim("respawn")
	host.play_sound("respawn")

func update(delta):
	# if animation is over, get jump input to respawn
	if not host.get_node('AnimationPlayer').is_playing():
		
		change_state("moving")
		return
	pass
