extends Control

@onready var texture_rect = %TextureRect
@onready var label = %Label

func _ready():
	Signals.game_started.connect(_on_game_started)

func _on_game_started():
	
	label.visible = false
	
	var modulate_tween = get_tree().create_tween()
	modulate_tween.tween_property(texture_rect, "modulate", Color.TRANSPARENT, 0.8)
	await modulate_tween.finished
	
	self.visible = false
