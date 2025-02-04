extends Control

@onready var score_value_label = %ScoreValueLabel
@onready var main_menu_button = %MainMenuButton

const LEVEL_1 = preload("res://scenes/level_1.tscn")

func _ready():
	score_value_label.text = str(GameState.player_score)
	main_menu_button.pressed.connect(on_main_menu_button_pressed)

func on_main_menu_button_pressed():
	GameState.reset()
