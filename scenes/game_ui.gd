extends CanvasLayer

@onready var label = %Label

func _ready():
	Signals.game_started.connect(_on_game_started)
	Signals.score_updated.connect(_on_score_updated)

func _on_game_started():
	label.visible = true

func _on_score_updated(new_score: int):
	label.text = str(new_score)

func _input(event: InputEvent):
	if event is InputEventKey:
		if event.is_action_pressed("start"):
			Signals.game_started.emit()
