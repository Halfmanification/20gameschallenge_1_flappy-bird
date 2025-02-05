extends Node

var player_data : PlayerData

const LEVEL_1 = preload("res://scenes/level_1.tscn")

func _ready():
	Signals.goal_reached.connect(_on_goal_reached)
	Signals.bird_crashed.connect(_on_bird_crashed)
	player_data = PlayerData.new()
	player_data.load()

func _on_goal_reached():
	player_data.current_score += 1
	if player_data.current_score > player_data.high_score:
		player_data.high_score = player_data.current_score
	Signals.score_updated.emit(player_data.current_score)

func _on_bird_crashed():
	save_game()
	get_tree().paused

func reset():
	player_data.current_score = 0
	load_game()
	get_tree().change_scene_to_packed(LEVEL_1)
	get_tree().paused = false

func save_game():
	player_data.save()

func load_game():
	player_data = PlayerData.new()
	player_data.load()
