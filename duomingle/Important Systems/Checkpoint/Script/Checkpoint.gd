class_name CheckPoint
extends Area2D

signal Checked(numId: int)


#Todo - Once I make the player manager and the savemanager, I need to be able to save the current checked one
#Later - Once I make the art for this, I need to change it as it looks pretty ugly
@export var checkId: int
var currentlyChecked: bool
var halfChecked: bool
@export var checkPointNames: Array[String]
@export var foodName: String
static var checkPointer: CheckPoint
#This is to make sure that it is both players that cross the line before the checkpoint activates
var remainingplayer: int = 0
#@export var offsetArray
#Nodes
@export var animPlayer: AnimationPlayer
@export var sprite: Sprite2D
@export var collisShape: CollisionShape2D

#region Functions

func _ready() -> void:
	checkPointer = self
	chooseFoodName()

func chooseFoodName() -> void:
	var randomizedFoodName = checkPointNames.pick_random()
	foodName = randomizedFoodName
	animPlayer.play(foodName + "-Unchecked")

func resetCheck() -> void:
	currentlyChecked = false
	halfChecked = false
	remainingplayer = 0
	animPlayer.play(foodName + "-Unchecked")

#endregion

#region Signal Functions
func playerBody(body: Node2D):
	
	if remainingplayer == body.playerId or remainingplayer == 3:
		return
	else:
		halfChecked = true
		remainingplayer += body.playerId
		animPlayer.play(foodName + "-Halfchecked")
	
	if remainingplayer >= 3:
		halfChecked = false
		currentlyChecked = true
		animPlayer.play(foodName + "-Checked")
		remainingplayer = 3
		Checked.emit(checkId)
		SignalManager.Checked.emit(checkId)

#endregion

	
	
	
	
