extends Resource
class_name GameState

enum Player {
	NONE, X, O
}

@export var _board = create_empty_board();
var board = _board :
	get:  return _board
	set(val):  pass

@export var _current_player: Player = Player.X;
var current_player = _current_player :
	get:  return _current_player
	set(val):  pass

@export var _score_X: int = 0;
var score_X = _score_X :
	get:  return _score_X
	set(val):  pass
	
@export var _score_O: int = 0;
var score_O = _score_O :
	get:  return _score_O
	set(val):  pass

func init():
	_board = create_empty_board();
	Events.current_player.emit(current_player);

func change_player():
	match current_player:
		Player.X:
			_current_player = Player.O;
		Player.O:
			_current_player = Player.X;
	Events.current_player.emit(current_player);

func update_board(id: int):
	@warning_ignore("integer_division")
	_board[(id / 3)][id % 3] = current_player # / 3 allow to have which line and % 3 to have the column
	check_and_emit_if_finished();
	change_player();

func check_and_emit_if_finished():
	var winner;
	for y in range(3):
		if all_equal(board[y][0], board[y][1], board[y][2]):
			winner = current_player;
	
	for x in range(3):
		if all_equal(board[0][x], board[1][x], board[2][x]):
			winner = current_player;
	
	var center = board[1][1]
	if center != Player.NONE:
		if all_equal(board[0][0], center, board[2][2]):
			winner = current_player;
		if all_equal(board[0][2], center, board[2][0]):
			winner = current_player;
	
	if winner != null:
		match winner:
			Player.X:
				_score_X = score_X + 1;
				Events.score_changed.emit(winner, score_X)
			Player.O:
				_score_O = score_O + 1;
				Events.score_changed.emit(winner, score_O)
		Events.finished.emit(winner);
	else:
		var is_draw = true;
		for x in range(3):
			for y in range(3):
				if board[y][x] == Player.NONE:
					is_draw = false;
		if is_draw:
			Events.finished.emit(Player.NONE);

func all_equal(a, b, c) -> bool:
	return a != Player.NONE and a == b and b == c

func create_empty_board():
	return [
		[Player.NONE, Player.NONE, Player.NONE],
		[Player.NONE, Player.NONE, Player.NONE],
		[Player.NONE, Player.NONE, Player.NONE]
	]
