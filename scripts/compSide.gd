extends StaticBody2D

@export var right = false

func _ready():
	if right:
		$Sprite2D.flip_h = true
