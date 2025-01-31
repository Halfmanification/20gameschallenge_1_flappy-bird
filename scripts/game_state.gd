extends Node

var player_score : int = 0

func _ready():
	Signals.goal_reached.connect(_on_goal_reached)

func _on_goal_reached():
	player_score += 1
	Signals.score_updated.emit(player_score)
