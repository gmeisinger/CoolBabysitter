extends "res://Scenes/StateMachine/baseState.gd"

func enter():
	host.play_anim("death")
	
func update(delta):
	if not host.get_node('AnimationPlayer').is_playing() and Input.is_action_just_pressed("jump"):
		change_state("respawn")
		return
