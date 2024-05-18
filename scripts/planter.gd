extends StaticBody2D

@export var horizontal := true

func _ready():
	if horizontal:
		$box.region_rect = Rect2i(360,0,144,72)
		$box.position = Vector2(0,-16)
		$plant1.position = Vector2(-44,-36)
		$plant2.position = Vector2(-1,-35)
		$plant3.position = Vector2(44,-35)
		$hShape.disabled = false
		$vShape.disabled = true
	else:
		$box.region_rect = Rect2i(144,180,72,144)
		$box.position = Vector2(0,38)
		$plant1.position = Vector2(-1,52)
		$plant2.position = Vector2(0,17)
		$plant3.position = Vector2(-1,-18)
		$hShape.disabled = true
		$vShape.disabled = false

func _process(_delta):
	pass
