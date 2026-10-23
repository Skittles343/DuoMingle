extends Node
#Next -- I need to make sure that I add Transitional Manager and make it functional.
#Later -- I may or may not deicded to keep the 3 latest nodes in the game to a array so yeah.


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

var incomingScenePath: String = ""

#endregion

#region Functions

func _ready() -> void:
	SignalManager.SceneManagerReadyToChange.connect(timeToChangeScene)

func changeScene( nextScene: String, dictNeeded: String = "level", transitionType: String = Transitionalmanager.defaultTransition):
	#Making sure that I can change it to more than just levels without having to write a lot when calling the function
	var dict: Dictionary = getDict(dictNeeded)
	
	if not dict.has(nextScene):
		push_error("Yo you put the wrong Scene name in or the scene just ain't added yet. Fix it now!")
		return
	
	incomingScenePath = dict[nextScene]
	#Print -- Here
	print("Still working")
	
	Transitionalmanager.playSceneClosingTransition(transitionType)
	switchSceneTo(dict[nextScene])

func startInitialScene(sceneName: String, dictNeeded: String = "level"):
	#Making sure that I can change it to more than just levels without having to write a lot when calling the function
	var dict: Dictionary = getDict(dictNeeded)
	if not dict.has(sceneName):
		push_error("Sorry but '%s' isn't in this dict. Fix it!" % sceneName)
		return
		
	incomingScenePath = ""
	switchSceneTo(dict[sceneName] )


func timeToChangeScene():
	if incomingScenePath == "" :
		push_error("Yo you def did something wrong. Just telling you bro")
		return
	
	switchSceneTo(incomingScenePath)
	incomingScenePath = ""


func switchSceneTo(scenePath: String, addTransition: bool = true):
	var packedScene: PackedScene = load(scenePath)
	if packedScene == null :
		push_error("Hey this incoming path ain't valid. By the way it was '%s' " % incomingScenePath )
		return
	
	var newScene := packedScene.instantiate()
	
	if Gamemanager.currentScene:
		Gamemanager.currentScene.queue_free()
	
	Gamemanager.currentScene = newScene
	Gamemanager.sceneHolder.add_child(newScene)
	
	if addTransition == true:
		#Next -- When I am doing the Player Holder, I need to move this to here.
		Transitionalmanager.playSceneOpeningTransition()

func getDict(Name: String) -> Dictionary:
	
	var dict: Dictionary
	if Name == "level":
		dict = levelDict
	elif Name == "ui":
		dict = uiDict
	elif Name == "Players":
		dict = playersDict
	
	return dict



#endregion






	
