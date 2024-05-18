extends CharacterBody2D


@export var speed := 300.0
@export var accel := 50
@export var friction := 20

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right","up","down")
	
	if direction.y > 0:
		$AnimatedSprite2D.play("front")
	elif direction.y < 0:
		$AnimatedSprite2D.play("back")
	if direction.x > 0:
		$AnimatedSprite2D.flip_h = false
		$CollisionShape2D.position.x = 1
		$interactBox/CollisionShape2D.position.x = 40
	elif direction.x < 0:
		$AnimatedSprite2D.flip_h = true
		$CollisionShape2D.position.x = -1
		$interactBox/CollisionShape2D.position.x = -40
	
	if direction:
		velocity = velocity.move_toward(Vector2(speed,speed)*direction, accel)
	else:
		velocity = velocity.move_toward(Vector2(), friction)

	move_and_slide()
