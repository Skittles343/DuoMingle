extends Node




#region Level Data
func saveLevelData(Name: String, checkPointNum: int):
	var newLevelData = LevelData.new()
	newLevelData.currentCheckPoint = checkPointNum
	var  resourcePath: String = Gamemanager.playerHelper.filePath + Name + ".tres"
	
	ResourceSaver.save( newLevelData, resourcePath)

#Next -- I need to find out what To do after you load in a res
func loadLevelData(Name: String):
	ResourceLoader.load(Gamemanager.playerHelper.filePath + Name + ".tres")

func deleteLevelData():
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






	
