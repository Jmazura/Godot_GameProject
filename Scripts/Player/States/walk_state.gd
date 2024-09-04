extends Player_State


func update_physics(delta):
	parent.walk(delta)
	if(parent.velocity == Vector2.ZERO):
		change_state("idle")
		return
	
	if(parent.direction.y < 0 and parent.direction.x == 0):
		parent.anim_player.play("walk_up")
	elif(parent.direction.y > 0 and parent.direction.x == 0):
		parent.anim_player.play("walk_down")
	
	if(parent.direction.x < 0):
		parent.anim_player.play("walk_left")
	elif(parent.direction.x > 0):
		parent.anim_player.play("walk_right")
	
