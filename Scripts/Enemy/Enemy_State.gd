extends Node
class_name Enemy_State

var parent: Enemy

func Enter():
	pass
	
func Exit():
	pass
	
@warning_ignore("unused_parameter")
func update(delta):
	pass
	
@warning_ignore("unused_parameter")
func update_physics(delta):
	pass
	
func change_state(new_state_name):
	get_parent().change_state(new_state_name)
