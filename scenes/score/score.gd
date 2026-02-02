extends Label

var player: GameState.Player:
	set(value):
		player = value
		if is_inside_tree():
			refresh()

func _ready() -> void:
	Events.score_changed.connect(current_score);

func current_score(winner: GameState.Player, score: int):
	if player == winner:
		text = str(score);

func refresh():
	match player:
		GameState.Player.X:
			text = str(GameSession.state.score_X);
		GameState.Player.O:
			text = str(GameSession.state.score_O);
