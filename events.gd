extends Node

signal cell_pressed(id: int);
signal new_game();
signal finished(player: GameState.Player);
signal current_player(player: GameState.Player);
signal score_changed(player: GameState.Player, score: int);
signal reset_score();
