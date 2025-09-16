extends CharacterBody2D
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

@export var max_speed := 700;
var last_dir := Vector2.RIGHT


func _process(delta: float) -> void:
	var dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = dir * max_speed
	if dir != Vector2.ZERO:
		last_dir = dir.normalized()
	move_and_slide()
	_update_anim(dir)

func _update_anim(dir: Vector2)-> void:
	#Idle
	if dir == Vector2.ZERO:
		var idle_anim := _walk_name_from_dir(last_dir)
		if anim.animation != idle_anim:
			anim.animation = idle_anim
		anim.flip_h = last_dir.x < 0
		anim.stop()
		anim.frame = 1
		return
	#moving
	var name := _walk_name_from_dir(dir)
	if anim.animation != name:
		anim.animation = name
	anim.flip_h = dir.x < 0
	if !anim.is_playing():
		anim.play()

func _walk_name_from_dir(vector: Vector2) -> String:
	var d := vector.normalized()
	# Diagonal/Straight movement
	if abs(d.y) < 0.4:
		return "walk_right"
	elif d.y < 0.0:
		if abs(d.x) > 0.4:
			return "walk_right_up"
		else:
			return "walk_up"
	else:
		if abs(d.x) > 0.4:
			return "walk_right_down"
		else:
			return "walk_down"
