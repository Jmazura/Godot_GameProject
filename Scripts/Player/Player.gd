extends CharacterBody2D
class_name Player

@onready var fsm: Node = $State_Machine
var direction: Vector2
var last_direction: float = 3.0

@export
var walk_speed = 1000
@export
var anim_player: AnimationPlayer

func _ready():
	pass
	
func _process(delta):
	fsm.process_frame(delta)
	

func _physics_process(delta):
	direction = Input.get_vector("Left", "Right", "Up", "Down").normalized()

	@warning_ignore("integer_division")
	velocity.x = move_toward(velocity.x, 0, walk_speed/4 * delta)
	@warning_ignore("integer_division")
	velocity.y = move_toward(velocity.y, 0, walk_speed/4 * delta)
	
	fsm.process_physics(delta)
	if(Input.is_action_just_pressed("Attack")):
		if(fsm.check_state("attack")):
			fsm.current_state.Enter()
		else:
			fsm.change_state("attack")
			
	# check parent last direction
	if(direction.x != 0):
		last_direction = direction.x
	move_and_slide()

func walk(delta):
	velocity = direction * walk_speed * delta
