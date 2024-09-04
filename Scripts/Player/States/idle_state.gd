extends Player_State

func update_physics(delta):
	parent.walk(delta)
	if(parent.velocity != Vector2.ZERO):
		change_state("walk")
	else:
		parent.anim_player.play("idle")
	
		
