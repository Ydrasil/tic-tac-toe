extends Node

var state: GameState;

func _ready() -> void:
	Events.cell_pressed.connect(cell_pressed);
	state = GameState.new();
	new_game();

func current_player():
	return state.current_player;

func cell_pressed(id: int):
	state.update_board(id);

func new_game():
	state.init();
	Events.new_game.emit();
