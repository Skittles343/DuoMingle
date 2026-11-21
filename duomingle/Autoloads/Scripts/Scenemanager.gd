extends Node
#Next -- I need to make sure that I add Transitional Manager and make it functional.
#Later -- I may or may not deicded to keep the 3 latest nodes in the game to a array so yeah.


#region Dict Containers

var levelDict = {
	"TestMap": "uid://b1lyeg2nv5f15",
	"Level1": "uid://c8vk2k046lbmy",
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
	#Print -- Here
	print("Bored")
	if not dict.has(nextScene):
		push_error("Yo you put the wrong Scene name in or the scene just ain't added yet. Fix it now!")
		return
	
	incomingScenePath = dict[nextScene]
	
	Transitionalmanager.playSceneClosingTransition(transitionType)
	switchSceneTo(dict[nextScene])

func startInitialScene(sceneName: String, dictNeeded: String = "level"):
	#Making sure that I can change it to more than just levels without having to write a lot when calling the function
	var dict: Dictionary = getDict(dictNeeded)
	if not dict.has(sceneName):
		push_error("Sorry but '%s' isn't in this dict. Fix it!" % sceneName)
		return
		
	#switchSceneTo(incomingScenePath)
	incomingScenePath = ""

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
	#Bug -- For some reaon there are two change scene funcs. Whenever I try to cancel one out, something for the player mnager doesn't work.
	if Gamemanager.currentScene:
		Gamemanager.currentScene.queue_free()
		#Print -- Here
	print("Bored")
	
	Gamemanager.currentScene = newScene
	Gamemanager.sceneHolder.add_child(newScene)
	
	if addTransition == true:
		pass
	SignalManager.PlayerHolderYourTime.emit()

func getDict(Name: String) -> Dictionary:
	
	var dict: Dictionary
	if Name == "level":
		dict = levelDict
	elif Name == "ui":
		dict = uiDict
	elif Name == "players":
		dict = playersDict
	
	return dict



#endregion






	
