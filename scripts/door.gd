extends Node2D

@export var bottom := false

@export var wall : Sprite2D
@export var wall2 : Sprite2D
@export var wall3 : Sprite2D

func _ready():
	if bottom:
		#$AnimatedSprite2D.position.y -= 72
		var temp = $enter/CollisionShape2D.position
		$enter/CollisionShape2D.position = $exit/CollisionShape2D.position
		$exit/CollisionShape2D.position = temp

func doorEntered(_body):
	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property(wall, "modulate", Color(1,1,1,.2), .25).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	if wall2: tween.tween_property(wall2, "modulate", Color(1,1,1,.2), .25).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	if wall3: tween.tween_property(wall3, "modulate", Color(1,1,1,.2), .25).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	if !bottom: tween.tween_property($AnimatedSprite2D, "modulate", Color(1,1,1,.2), .25).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	await get_tree().create_timer(.5).timeout
	$enter.set_deferred("monitoring",false)
	$exit.set_deferred("monitoring",true)
	#print("entered")

func doorExited(_body):
	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property(wall, "modulate", Color(1,1,1,1), .25).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	if wall2: tween.tween_property(wall2, "modulate", Color(1,1,1,1), .25).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	if wall3: tween.tween_property(wall3, "modulate", Color(1,1,1,1), .25).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	if !bottom: tween.tween_property($AnimatedSprite2D, "modulate", Color(1,1,1,1), .25).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	await get_tree().create_timer(.5).timeout
	$enter.set_deferred("monitoring",true)
	$exit.set_deferred("monitoring",false)
	#print("exited")

func doorOpen(_body):
	$AnimatedSprite2D.play("open")

func doorClose(_body):
	$AnimatedSprite2D.play("close")
