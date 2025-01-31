extends CanvasLayer

@onready var label = %Label

func _ready():
	Signals.score_updated.connect(_on_score_updated)

func _on_score_updated(new_score: int):
	label.text = str(new_score)
