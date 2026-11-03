extends Node

var checkableScenes: Dictionary = {}

func _ready() -> void:
	SignalManager.PlayerHolderYourTime.connect(getThingsReady)

func addPlayerChild(playerToAdd: String):
	var packedPlayerScene: PackedScene = load(playerToAdd)
	if not packedPlayerScene == null:
		push_error("Sorry but this player's uid isn't working in the Player Helper")
		
		var instantiatedPlayerScene := packedPlayerScene.instantiate()
		add_child(instantiatedPlayerScene)

func getThingsReady():
	#Print -- Here 
	print("It is working")
	Transitionalmanager.playSceneOpeningTransition()

func appendScene(Name: String, dictName: String, uid: String):
	
	var dictArray: Array
	#Need to make sure that I get the right dict name
	var dict: String
	if dictName == "Level" or dictName == "level":
		dict = "level"
	elif dictName == "ui" or dictName == "UI":
		dict = "ui"
	elif dictName == "players" or dictName == "Players":
		dict = "players"
		
	var packedUid = load(uid)
	if packedUid == null:
		push_error("The Uid Ain't right")
	
	#I need to remember that the dict name is first and the uid is the second
	dictArray.append(dict)
	dictArray.append(uid)
	checkableScenes[Name] = dictArray
	#Print -- Here
	print(checkableScenes[Name])


	

	 



	
