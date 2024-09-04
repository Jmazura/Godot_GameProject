extends CharacterBody2D
class_name Enemy

@export var fsm: Node

@export
var walk_speed = 1000
@export
var anim_player: AnimationPlayer

var direction: Vector2
var last_direction: float

func _ready():
	pass
	
func _process(delta):
	fsm.process_frame(delta)
	

func _physics_process(delta):

	@warning_ignore("integer_division")
	velocity.x = move_toward(velocity.x, 0, walk_speed/4 * delta)
	@warning_ignore("integer_division")
	velocity.y = move_toward(velocity.y, 0, walk_speed/4 * delta)
	
			
	# check parent last direction
	if(direction.x != 0):
		last_direction = direction.x
	move_and_slide()

func walk(delta):
	velocity = direction * walk_speed * delta

func got_hit():
	fsm.change_state("hurt")
