extends Label

@export var score_player: int = 0;
@export var player: GameState.Player;

func _ready() -> void:
	text = str(score_player);
	Events.finished.connect(increment_score)

func increment_score(winner: GameState.Player):
	if player == winner:
		score_player = score_player + 1
		text = str(score_player);
