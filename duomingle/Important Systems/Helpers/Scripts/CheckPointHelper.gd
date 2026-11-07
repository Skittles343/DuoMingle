class_name CheckPointHelper
extends Node2D

@export var checkPointHolder: Node2D
@export var checkPointMarker: Node2D
@export var checkPoints: PackedScene
var checkPoint

func _ready() -> void:
	SignalManager.Checked.connect(resetChecked)
	#checkPoint.Checked.connect(resetChecked)

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

func resetChecked(Id: int):
	for check in checkPointHolder.get_children():
		if check.currentlyChecked == false and check.halfChecked == false:
			continue
		elif check.currentlyChecked == true and check.checkId == Id:
			continue
		else:
			check.resetCheck()






	
