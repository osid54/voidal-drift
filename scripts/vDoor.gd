extends Node2D

func doorOpen(_body):
	$AnimatedSprite2D.play("open")

func doorClose(_body):
	$AnimatedSprite2D.play("close")
