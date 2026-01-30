extends Label

func _ready() -> void:
	Events.finished.connect(show_result)

func show_result(player):
	if player == GameState.Player.NONE:
		text = 'Draw';
	else:
		var current_player;
		match player:
			GameState.Player.X:
				current_player = 'X';
			GameState.Player.O:
				current_player = 'O'
		text = current_player + ' win';
