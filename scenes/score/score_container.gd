extends VBoxContainer

@export var player: GameState.Player;

@onready var name_label: Label = $Player
@onready var score_label: Label = $Score

func _ready() -> void:
	match player:
		GameState.Player.X:
			name_label.text = 'X'
		GameState.Player.O:
			name_label.text = 'O'
	score_label.player = player;
