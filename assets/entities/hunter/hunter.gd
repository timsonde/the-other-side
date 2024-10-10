class_name Player extends CharacterBody2D

const SPEED = 100.0

func _physics_process(_delta: float) -> void:
	
	var directionX := Input.get_axis("move_left", "move_right")
	var directionY := Input.get_axis("move_up", "move_down")
	
	if directionX or directionY: 
		var diag = 1
		if directionY and directionX:
			diag = 0.75
		velocity.x = directionX * SPEED * diag
		velocity.y = directionY * SPEED * diag
			
	else:
		velocity.x = 0
		velocity.y = 0

	move_and_slide()
