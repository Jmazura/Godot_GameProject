extends Node

@export var initiale_state: Player_State
@export var player: Player

var states : Dictionary = {}
var current_state: Player_State
#var new_state: State

func _ready():
	player = get_parent()
	for child in get_children():
		if child is Player_State: 
			states[child.name] = child
			child.parent = player
	
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
