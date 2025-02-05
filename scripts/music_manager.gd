extends Node

@onready var main_music = %MainMusic
@onready var goal_reached = %GoalReached
@onready var lose_game = %LoseGame

func _ready():
	main_music.play()
	Signals.goal_reached.connect(_on_goal_reached)
	Signals.bird_crashed.connect(_on_bird_crashed)

func _on_goal_reached():
	goal_reached.play()

func _on_bird_crashed():
	lose_game.play()
