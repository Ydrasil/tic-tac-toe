extends Node

var state: GameState;

func _ready() -> void:
	if ResourceLoader.exists('user://GameState.tres'):
		state = ResourceLoader.load('user://GameState.tres').duplicate(true);
	else:
		state = GameState.new();
	new_game();
	Events.cell_pressed.connect(cell_pressed);
	Events.finished.connect(save);
	Events.reset_score.connect(reset_score);

func current_player():
	return state.current_player;

func cell_pressed(id: int):
	state.update_board(id);

func new_game():
	state.init();
	Events.new_game.emit();

func save(_player):
	ResourceSaver.save(state, 'user://GameState.tres');

func reset_score():
	state.reset_score();
	save(GameState.Player.NONE)
