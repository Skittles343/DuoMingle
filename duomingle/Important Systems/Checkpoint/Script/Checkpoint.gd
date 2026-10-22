class_name CheckPoint
extends Area2D

signal Checked


#Todo - Once I make the player manager and the savemanager, I need to be able to save the current checked one
#Later - Once I make the art for this, I need to change it as it looks pretty ugly
@export var checkId: int
@export var currentlyChecked: bool
@export var halfChecked: bool
@export var checkPointNames: Array[String]
@export var foodName: String
#This is to make sure that it is both players that cross the line before the checkpoint activates
var remainingplayer: int = 0
#@export var offsetArray
#Nodes
@export var animPlayer: AnimationPlayer
@export var sprite: Sprite2D
@export var collisShape: CollisionShape2D

#region Functions

func _ready() -> void:
	chooseFoodName()

func chooseFoodName() -> void:
	var randomizedFoodName = checkPointNames.pick_random()
	foodName = randomizedFoodName


#endregion

#region Signal Functions
#Print -- Here
func playerBody(body: Node2D):
	
	if remainingplayer == body.playerId or remainingplayer == 3:
		return
	else:
		remainingplayer += body.playerId
		print(body.playerId)
		animPlayer.play(foodName + "-Halfchecked")
		print(remainingplayer)
	
	if remainingplayer >= 3:
		Checked.emit()
		remainingplayer = 3
		animPlayer.play(foodName + "-Checked")
		print("Checked")

#endregion

	
	
	
	
