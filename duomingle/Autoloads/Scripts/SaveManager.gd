extends Node

func saveLevelData(name: String, checkPointNum: int):
	var newLevelData = LevelData.new()
	newLevelData.currentCheckPoint = checkPointNum
	var  resourcePath: String = Gamemanager.playerHelper.filePath + name + ".tres"
	
	ResourceSaver.save( newLevelData, resourcePath)

func deleteLevelData():
	for file in DirAccess.get_files_at(Gamemanager.playerHelper.filePath):
		DirAccess.remove_absolute(Gamemanager.playerHelper.filePath + file)








	
