extends Node




#region Level Data
func saveLevelData(Name: String, checkPointNum: int):
	var  resourcePath: String = Gamemanager.playerHelper.filePath + Name + ".tres"
	var newLevelData: LevelData
	if isLevelDataThere(Name):
		newLevelData = ResourceLoader.load(resourcePath)
		newLevelData.currentCheckPoint = checkPointNum
	else:
		newLevelData = LevelData.new()
		newLevelData.currentCheckPoint = checkPointNum
	
	ResourceSaver.save( newLevelData, resourcePath)

#Next -- I need to find out what To do after you load in a res
func loadLevelData(Name: String):
	var dictResource: Dictionary = {}
	var loadedResource: LevelData = ResourceLoader.load(Gamemanager.playerHelper.filePath + Name + ".tres")
	dictResource["CheckpointId"] = loadedResource.currentCheckPoint
	print(dictResource)
	#Print -- Here
	return dictResource

func deleteLevelData(name: String = ""):
	#if name != "":
		#for file in DirAccess.get_files_at(Gamemanager.playerHelper.filePath):
			#if file.begins_with(name):
				#DirAccess.remove_absolute(Gamemanager.playerHelper.filePath + file)
			#else:
				#continue
	#else:
		for file in DirAccess.get_files_at(Gamemanager.playerHelper.filePath):
			DirAccess.remove_absolute(Gamemanager.playerHelper.filePath + file)

func isLevelDataThere(Name: String) -> bool:
	for file in DirAccess.get_files_at(Gamemanager.playerHelper.filePath):
		if file.begins_with(Name):
			return true
		else:
			continue
	return false

#endregion






	
