extends Node

#For transitional manager and scene manager
signal SceneManagerReadyToChange
#For Player Holder and Scenemanager
signal PlayerHolderYourTime(sceneName: String)
#Checkpoints
signal Checked(numId: int)
#For Player Helper and CheckpointHelper
signal checkPointNumPos(num: int)
