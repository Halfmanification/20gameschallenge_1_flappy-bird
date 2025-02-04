extends Node

var player_score : int = 0

const LEVEL_1 = preload("res://scenes/level_1.tscn")

func _ready():
	Signals.goal_reached.connect(_on_goal_reached)
	Signals.bird_crashed.connect(_on_bird_crashed)

func _on_goal_reached():
	player_score += 1
	Signals.score_updated.emit(player_score)

func _on_bird_crashed():
	get_tree().paused

func reset():
	player_score = 0
	get_tree().change_scene_to_packed(LEVEL_1)
	get_tree().paused = false
