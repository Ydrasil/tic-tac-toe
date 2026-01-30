extends Label

func _ready() -> void:
	Events.current_player.connect(current_player);
	current_player(GameSession.current_player());

func current_player(player: GameState.Player):
	var current_player;
	match player:
		GameState.Player.X:
			current_player = 'X';
		GameState.Player.O:
			current_player = 'O';
	text = current_player + ' to play';
