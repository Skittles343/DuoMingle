extends Node
#Next -- I need to make sure that I add Transitional Manager and make it functional.



#region Dict Containers

var levelDict = {
	"TestMap": "uid://b1lyeg2nv5f15",
}

var uiDict = { }

var playersDict = {
	"BaldPlayer": "uid://c81x2esc5p8ms",
}

var impDict = { }

#endregion

#region variables


#endregion

#region Functions

func changeScene( nextScene: String, dictNeeded: String = "level"):
	#Making sure that I can change it to more than just levels without having to write a lot when calling the function
	var dict: Dictionary
	if dictNeeded == "level":
		dict = levelDict
	elif dictNeeded == "ui":
		dict = uiDict
	
	if not dict.has(nextScene):
		push_error("Yo you put the wrong Scene name in or the scene just ain't added yet. Fix it now!")
		return
	
	var scenePath = dict[nextScene]
	var packedScene = load(scenePath)
	
	if packedScene == null:
		push_error("Yo the Scene path for '%s' you better fix it!" % nextScene)
		return
	
	var newScene = packedScene.instantiate()
	
	if (Gamemanager.currentScene):
		Gamemanager.currentScene.queue_free()
	
	Gamemanager.currentScene = newScene
	Gamemanager.sceneHolder.add_child(newScene)



	
#endregion






	
