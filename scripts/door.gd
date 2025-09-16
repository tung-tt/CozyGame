extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node)-> void:
	if body.is_in_group("player"):
		Signalbus.doorEntered.emit()
	
