extends Node

const END_SCREEN = preload("res://scenes/end_screen.tscn")
@onready var bird = %Bird

func _ready():
	Signals.bird_crashed.connect(_on_bird_crashed)

func _on_bird_crashed():
	var end_game_menu = END_SCREEN.instantiate()
	add_child(end_game_menu)
