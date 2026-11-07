extends Node2D
@onready var checkPointHelper: CheckPointHelper = $CheckPointHelper

func _ready() -> void:
	Gamemanager.playerHelper.appendScene(name, "level", "uid://b1lyeg2nv5f15")
	checkPointHelper.makeThePoints()

#Todo -- I should make a level manager to hold all of the level functions


	
