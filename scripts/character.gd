extends CharacterBody2D

var max_speed := 500;

func _process(delta: float) -> void:
	
	var direction = Vector2((Input.get_axis("move_left", "move_right")), 
	(Input.get_axis("move_up", "move_down"))).normalized()

	position += direction * max_speed * delta
	
	move_and_slide()
