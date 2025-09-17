extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signalbus.doorEntered.connect(_on_door_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("restart"):
		_restart_game()

func _on_door_entered()-> void:
	sceneChange("res://scenes/room_town_test.tscn")

func sceneChange(sceneTo)-> void:
	get_tree().change_scene_to_file(sceneTo)

func _restart_game()-> void:
	var current_scene := get_tree().current_scene
	if current_scene:
		get_tree().reload_current_scene()
