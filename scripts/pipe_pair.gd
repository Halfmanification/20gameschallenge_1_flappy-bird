extends Node2D
class_name PipePair

@export var speed: float = 200
@export var min_opening: float = 75
@export var max_opening: float = 150

@onready var top_pipe = $TopPipe
@onready var bottom_pipe = $BottomPipe
@onready var goal = %Goal

func _ready():
	goal.body_entered.connect(_on_body_entered)
	
	var opening := randf_range(min_opening, max_opening)
	top_pipe.position.y -= opening/2
	bottom_pipe.position.y += opening/2
	position.y = randi_range(opening + 50, 800)

func _physics_process(delta):
	position.x -= speed * delta
	if position.x < -64:
		queue_free()

func _on_body_entered(body: Node2D):
	if body is Bird:
		Signals.goal_reached.emit()
