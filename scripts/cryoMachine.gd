extends StaticBody2D

@export var type := 0

func _ready():
	await get_tree().create_timer(randf_range(0,1)).timeout
	match(type):
		1:
			$AnimatedSprite2D.play("open")
		2:
			$AnimatedSprite2D.play("front")
		3:
			$AnimatedSprite2D.play("back")
