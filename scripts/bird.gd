extends CharacterBody2D
class_name Bird

@export var flap_strength: float = -500
@export var gravity: float = 1300
@export var terminal_velocity: float = 1000.0
@export var max_rotation: float = PI/4

@onready var sprite = $Sprite2D
@onready var animation_player = %AnimationPlayer

var can_flap: bool = false
var is_flapping: bool = false
var idle: bool = true
var original_y_position: float

func _ready():
	Signals.game_started.connect(_on_game_started)
	Signals.bird_crashed.connect(_on_bird_crashed)
	animation_player.play("idle")

func _physics_process(delta):
	
	if idle:
		return
	
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
	
	if can_flap and event.is_action_pressed("flap") and is_flapping == false:
		is_flapping = true
		
		if idle == true:
			idle = false

func _on_game_started():
	can_flap = true

func _on_bird_crashed():
	queue_free()
