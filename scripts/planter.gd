extends StaticBody2D

@export var horizontal := true
@export var broken := false

func _ready():
	if broken:
		$plant1.visible = false
		$plant2.visible = false
		$plant3.visible = false
	if horizontal:
		if broken: $box.region_rect = Rect2i(828,0,144,72)
		else: 
			$box.region_rect = Rect2i(360,0,144,72)
		$box.position = Vector2(0,-16)
		$plant1.position = Vector2(-44,-36)
		$plant2.position = Vector2(-1,-35)
		$plant3.position = Vector2(44,-35)
		$hShape.disabled = false
		$vShape.disabled = true
	else:
		if broken: $box.region_rect = Rect2i(216,180,72,144)
		else: 
			$box.region_rect = Rect2i(144,180,72,144)
		$box.position = Vector2(0,38)
		$plant1.position = Vector2(-1,52)
		$plant2.position = Vector2(0,17)
		$plant3.position = Vector2(-1,-18)
		$hShape.disabled = true
		$vShape.disabled = false

func _process(_delta):
	if !Autoload.farmFixed and broken:
		return
	broken = false
	_ready()

func interact():
	if broken: return
	$plant1.visible = true
	$plant2.visible = true
	$plant3.visible = true
	$plant1.stage = 1
	$plant2.stage = 1
	$plant3.stage = 1
	$plant1.startAnim()
	$plant2.startAnim()
	$plant3.startAnim()
