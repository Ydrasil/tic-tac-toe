extends Control

func _ready() -> void:
	Events.finished.connect(finished);

func _on_button_pressed() -> void:
	hide();

func finished(_player):
	show();
