extends Node2D

func _ready() -> void:
	Gamemanager.playerHelper.appendScene(name, "level", "uid://b1lyeg2nv5f15")
	await get_tree().create_timer(0.5).timeout
	Scenemanager.changeScene("TestMap")
