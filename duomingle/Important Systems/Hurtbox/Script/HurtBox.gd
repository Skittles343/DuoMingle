@icon("uid://ht8xgdhs1h25")
class_name HurtBox
extends Area2D

signal hitReceived

func deathAreaHit(area: Area2D):
	hitReceived.emit()
