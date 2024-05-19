extends StaticBody2D

@export var horizontal := true
@export var broken := false

func _ready():
	if horizontal:
		if broken: $box.region_rect = Rect2i(828,0,144,72)
		else: $box.region_rect = Rect2i(360,0,144,72)
		$box.position = Vector2(0,-16)
		$plant1.position = Vector2(-44,-36)
		$plant2.position = Vector2(-1,-35)
		$plant3.position = Vector2(44,-35)
		$hShape.disabled = false
		$vShape.disabled = true
	else:
		if broken: $box.region_rect = Rect2i(216,180,72,144)
		else: $box.region_rect = Rect2i(144,180,72,144)
		$box.position = Vector2(0,38)
		$plant1.position = Vector2(-1,52)
		$plant2.position = Vector2(0,17)
		$plant3.position = Vector2(-1,-18)
		$hShape.disabled = true
		$vShape.disabled = false

func _process(_delta):
	pass
