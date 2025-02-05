extends Resource
class_name PlayerData

const SAVE_GAME_PATH := "user://savegame.tres"

@export var high_score : int
var current_score : int

func save() -> void:
	var data := PlayerData.new()
	data.high_score = self.high_score
	
	print(data.high_score)
	print(OS.get_data_dir())
	
	var error := ResourceSaver.save(data, SAVE_GAME_PATH)
	if error:
		print("An error happened while saving data: ", error)

func load():
	var data : PlayerData = ResourceLoader.load(SAVE_GAME_PATH, "", ResourceLoader.CACHE_MODE_IGNORE)
	if !data:
		print("No save data found")
		return
	
	high_score = data.high_score
	print("loaded from file: ", high_score)
