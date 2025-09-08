extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_area_entered)
	

func _on_area_entered()-> void:
	Signalbus.doorEntered.emit()
	
