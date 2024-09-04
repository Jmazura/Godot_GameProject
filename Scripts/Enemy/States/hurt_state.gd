extends Enemy_State

func Enter():
	parent.anim_player.play("hurt_right")

func update(delta):
	if(!parent.anim_player.is_playing()):
		change_state("idle")

	
