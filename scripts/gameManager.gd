extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signalbus.doorEntered.connect(_on_door_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_door_entered()-> void:
	sceneChange("res://scenes/room_town_test.tscn")

func sceneChange(sceneTo)-> void:
	get_tree().change_scene_to_file(sceneTo)
