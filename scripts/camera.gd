extends Camera2D

const CAMERA_SPEED = 5

var player: Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	
	position_smoothing_enabled = true
	position_smoothing_speed = CAMERA_SPEED
	zoom = Vector2(0.35, 0.35)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		position = player.position
