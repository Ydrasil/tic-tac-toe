extends Button

func _on_pressed() -> void:
	Events.reset_score.emit();
