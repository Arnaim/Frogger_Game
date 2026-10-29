extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var speed: int = 100

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	animation()	
	velocity = direction * speed
	move_and_slide()

func animation():
	if direction:
		if direction.x < 0:
			$AnimatedSprite2D.play("left")
		elif direction.x > 0:
			$AnimatedSprite2D.play("right")
		elif direction.y < 0:
			$AnimatedSprite2D.play("up")
		else:
			$AnimatedSprite2D.play("down")
	else:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 0
