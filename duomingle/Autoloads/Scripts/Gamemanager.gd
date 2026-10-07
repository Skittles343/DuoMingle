extends Node


#region variables

var currentScene: Node = null

#region RootHolder vars

var rootHolder: Node
var sceneHolder: Node
var uiHolder: Node
var playerHelper:Node

#endregion


#endregion


#region functions

func _ready() -> void:
	
	#Getting all of the autoload (not actual autoload) scenes from the root
	rootHolder = get_tree().root.get_node("RootHolder")
	sceneHolder = rootHolder.get_child(0)
	uiHolder = rootHolder.get_child(1)
	playerHelper = rootHolder.get_child(2)
	
	startFirstScene("TestMap")

func startFirstScene(theScene: String):
	Scenemanager.changeScene(theScene)

#endregion




	
