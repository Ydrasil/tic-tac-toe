extends Button

@export var cell_id: int; # describe which cell on the board from 0 to 9

func _ready() -> void:
	Events.finished.connect(finished);

func _on_pressed() -> void:
	match GameSession.current_player():
		GameState.Player.X:
			text = 'X';
		GameState.Player.O:
			text = '0';
	disabled = true;
	Events.cell_pressed.emit(cell_id);

func finished(_player):
	disabled = true;
