extends Node

const pipe_pair_scene = preload("res://scenes/pipe_pair.tscn")

@onready var timer = $Timer

func _ready():
	Signals.game_started.connect(_on_game_started)
	timer.timeout.connect(_on_timeout)

func _on_game_started():
	timer.start()

func _on_timeout():
	var pipe_pair = pipe_pair_scene.instantiate()
	pipe_pair.position.x = 700
	add_child(pipe_pair)
