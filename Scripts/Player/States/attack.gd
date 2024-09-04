extends Player_State

var enter_count: int


func Enter():
	enter_count += 1
	if(parent.direction.x < 0):
		parent.anim_player.play("attack_left")
	elif(parent.direction.x > 0):
		parent.anim_player.play("attack_right")
	else:
		if(parent.last_direction < 0):
			parent.anim_player.play("attack_left")
		elif(parent.last_direction > 0):
			parent.anim_player.play("attack_right")

	print(enter_count)
	
@warning_ignore("unused_parameter")
func update(delta):

	if(!parent.anim_player.is_playing()):
		change_state("idle")

func Exit():
	enter_count = 0	



func _on_punch_area_area_entered(area):
	area.get_parent().got_hit()
