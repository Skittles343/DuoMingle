class_name Player
extends CharacterBody2D

#Later -- i need to make the player controller more floaty and better instead of strict and rigid

#region variables

#region Scripts vars
@export var playerName: String
@export var playerId: int
enum enumStateMachine {
	Idle,
	Moving,
	Death,
	Jump
}
var currentEnumState: enumStateMachine
@export var gravity : float = ProjectSettings.get_setting("physics/2d/default_gravity") - 350
@export var jumpingForce : float = -30
var direction
var isJumping: bool
@export var speed: float
@onready var currentStateLabel: Label = $"Current Enum State"


#endregion 

#region Nodes

@export var animPlayer: AnimatedSprite2D
@export var hurtBox: Area2D

#endregion

#endregion


#region Functions

func _ready() -> void:
	currentEnumState = enumStateMachine.Idle


func _physics_process(delta: float) -> void:
	handleDirection(delta)
	handleGravity(delta)
	handleJump()
	handleMovement(delta)
	
	move_and_slide()
	
func _process(delta: float) -> void:
	handleAnimation()

func handleGravity(delta: float):
	if not is_on_floor():
		velocity.y += gravity 

func handleDirection(delta: float):
	var inputDirection = Input.get_axis("Move_Left " + str(playerId), "Move_Right " + str(playerId) )
	direction = Vector2(inputDirection, 0)
	if direction.x != 0 and isJumping == false and currentEnumState != enumStateMachine.Death:
		currentEnumState = enumStateMachine.Moving
	elif direction.x == 0 and isJumping == false and currentEnumState != enumStateMachine.Death:
		currentEnumState = enumStateMachine.Idle

func handleJump():
	if Input.is_action_just_pressed("Jump " + str(playerId) ):
		currentEnumState = enumStateMachine.Jump

func handleMovement(delta: float):
	match currentEnumState:
		enumStateMachine.Idle:
			velocity.x = 0
		enumStateMachine.Moving:
			velocity.x += speed * direction.x * delta
		enumStateMachine.Jump:
			isJumping = true
			velocity.y = jumpingForce
			isJumping = false
			currentEnumState = enumStateMachine.Idle if direction.x == 0 else enumStateMachine.Moving

func handleAnimation():
	match currentEnumState:
		enumStateMachine.Idle:
			playAnimation("Idle")
			currentStateLabel.text = "Idle"
		enumStateMachine.Moving:
			playAnimation("Run")
			currentStateLabel.text = "Moving"
		enumStateMachine.Jump:
			playAnimation("Jump")
			currentStateLabel.text = "Jump"
		enumStateMachine.Death:
			playAnimation("Death")
			currentStateLabel.text = "Death"

func playAnimation(animationToPlay: String):
	animPlayer.play(animationToPlay)

#endregion

#region Signal Functions

#endregion



	
