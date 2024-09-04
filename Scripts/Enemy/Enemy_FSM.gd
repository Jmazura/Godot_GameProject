extends Node

@export var initiale_state: Enemy_State
@export var enemy: Enemy

var states : Dictionary = {}
var current_state: Enemy_State
#var new_state: State

func _ready():
	enemy = get_parent()
	for child in get_children():
		if child is Enemy_State: 
			states[child.name] = child
			child.parent = enemy
	
	if initiale_state:
		initiale_state.Enter()
		current_state = initiale_state
	
func process_frame(delta):
	if current_state:
		current_state.update(delta)

func process_physics(delta):
	if current_state:
		current_state.update_physics(delta)
	
func change_state(new_state_name):
	var new_state = states.get(new_state_name)
	if !new_state:
		return
	
	if current_state:
		current_state.Exit()
	
	new_state.Enter()
	current_state = new_state
	
func check_state(check_state_name: String):
	if(check_state_name == current_state.name):
		return true
	else:
		return false
