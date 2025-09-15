extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var max_speed := 700;

func _process(delta: float) -> void:
	
	var direction = Vector2((Input.get_axis("move_left", "move_right")), 
	(Input.get_axis("move_up", "move_down"))).normalized()

	position += direction * max_speed * delta
	
	move_and_slide()
	
	#Visuals
	if direction.y != 0:
		if direction.y < 0:
			animated_sprite.animation = "walk_up"
		else:
			animated_sprite.animation = "walk_down"
	elif direction.x != 0:
		animated_sprite.animation = "walk_right"
		if direction.x < 0:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false
