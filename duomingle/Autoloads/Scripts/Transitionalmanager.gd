extends Node

#Vars
@export var defaultTransition: String = "Horizontal"
#Node Children
@export var animPlayer: AnimationPlayer

#func _ready() -> void:
	#SignalManager.TransitionalManagerReadyToReveal.connect(playSceneOpeningTransition)

func playSceneClosingTransition(transition: String = defaultTransition ): 
	animPlayer.play(transition + "-Close")

func playSceneOpeningTransition(transition: String = defaultTransition ): 
	animPlayer.play(transition + "-Open")

func changeScene():
	SignalManager.SceneManagerReadyToChange.emit()







	
