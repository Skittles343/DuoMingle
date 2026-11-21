class_name CheckPointHelper
extends Node2D

@export var checkPointHolder: Node2D
@export var checkPointMarker: Node2D
@export var checkPoints: PackedScene
var checkPointId: int = 0

func _ready() -> void:
	SignalManager.Checked.connect(resetChecked)
	SignalManager.checkPointNumPos.connect(getCheckPointPos)

func makeThePoints():
	var counter: int = -1
	for mark in checkPointMarker.get_children():
		if not (mark is Marker2D):
			return
		
		var  checkPoint = checkPoints.instantiate()
		checkPointHolder.add_child(checkPoint)
		checkPoint.global_position = mark.global_position
		counter+= 1
		checkPoint.checkId = counter
		mark.queue_free()

func resetChecked(id: int):
	for check in checkPointHolder.get_children():
		if check.currentlyChecked == false and check.halfChecked == false:
			continue
		elif check.currentlyChecked == true and check.checkId == id:
			checkPointId = id
			continue
		else:
			check.resetCheck()
	Scenemanager.changeScene("Level1")

func getCheckPointPos(checkId: int ):
	
	for check : CheckPoint in checkPointHolder.get_children():
		if check.checkId == checkId:
			Gamemanager.playerHelper.hasCheckPos(check.global_position)
			resetChecked(check.checkId)




	
