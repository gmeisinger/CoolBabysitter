extends "res://Scenes/StateMachine/baseState.gd"

var anim
var anim_name

func enter():
	if not host.ladder:
		change_state("moving")
		return
	host.z_index = -2
	host.ladder.height_to_offset(host.global_position.y)
	host.global_position = host.ladder.get_pos()
	host.velocity = Vector2.ZERO
	anim_name = "up_ladder_front"
	if host.ladder.side:
		anim_name = "up_ladder_side"
	host.play_anim(anim_name)
	anim = host.get_node("AnimationPlayer")
	#anim.stop(false)

func update(delta):
	if Input.is_action_just_pressed("jump"):
		change_state("jumping")
		return
	host.process_ladder_movement(delta)
	var end_reached = host.ladder.move_offset(host.velocity.y)
	if end_reached:
		change_state("moving")
		return
	#if host.velocity.y == 0.0:
	#	anim.playback_active = false
	#else:
		#anim.play(anim_name)
	#	anim.playback_active = true
	anim.seek(host.ladder.get_progress() * anim.current_animation_length)
	host.global_position = host.ladder.get_pos()

func exit():
	#host.velocity = Vector2.ZERO
	host.z_index = 0
	pass
