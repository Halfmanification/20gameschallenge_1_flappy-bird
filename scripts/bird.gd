extends CharacterBody2D
class_name Bird

@export var flap_strength: float = -500
@export var gravity: float = 1300
@export var terminal_velocity: float = 1000.0
@export var max_rotation: float = PI/8

@onready var sprite = $Sprite2D
@onready var area_2d = $Area2D

var is_flapping: bool = false

func _ready():
	area_2d.body_entered.connect(_on_body_entered)

func _physics_process(delta):
	velocity.y = minf(terminal_velocity, velocity.y + (gravity * delta))
	
	if is_flapping:
		velocity.y = flap_strength
		is_flapping = false
	
	if velocity.y > 0 and rotation != max_rotation:
		rotation = max_rotation
	elif velocity.y < 0 and rotation != -max_rotation:
		rotation = -max_rotation
	
	move_and_slide()

func _input(event: InputEvent) -> void:
	if !(event is InputEventKey):
		pass
	
	if event.is_action_pressed("flap") and is_flapping == false:
		is_flapping = true

func _on_body_entered(body: Node2D) -> void:
	if body is Pipe:
		get_tree().quit()
