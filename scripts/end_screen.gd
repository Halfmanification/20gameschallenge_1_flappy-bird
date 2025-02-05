extends Control

@onready var score_value_label = %ScoreValueLabel
@onready var high_score_label = %HighScoreLabel
@onready var main_menu_button = %MainMenuButton
@onready var quit_game_button = %QuitGameButton

const LEVEL_1 = preload("res://scenes/level_1.tscn")

func _ready():
	score_value_label.text = str(GameState.player_data.current_score)
	high_score_label.text = str(GameState.player_data.high_score)
	main_menu_button.pressed.connect(_on_main_menu_button_pressed)
	quit_game_button.pressed.connect(_on_quit_game_button_pressed)

func _on_main_menu_button_pressed():
	GameState.reset()

func _on_quit_game_button_pressed():
	get_tree().quit()
