class_name Player
extends CharacterBody2D


@onready var animation_tree = $AnimationTree
@onready var animation_state_machine = animation_tree["parameters/playback"]
@onready var state_machine: Node = $State_Machine

@export var speed: float = 1000.0
var direction: Vector2

func _ready():
	animation_state_machine.travel("IDLE")	
	state_machine.init(self)

func _process(delta: float):
	state_machine.process_frame(delta)
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float):
	state_machine.process_physics(delta)
	#direction = Input.get_vector("left", "right", "up", "down").normalized()
	#
	#if direction:
	#	velocity = direction * speed * delta
	#	animation_state_machine.travel("Walking")
	#	animation_tree["parameters/Walking/blend_position"] = direction
	#	
	#else:
	#	velocity = Vector2.ZERO
	#	animation_state_machine.travel("IDLE") 
	
