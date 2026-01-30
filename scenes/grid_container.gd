extends GridContainer

@export var cell_scene: PackedScene;

func _ready() -> void:
	Events.new_game.connect(new_game);
	Events.new_game.emit(); # should be called in state

func new_game():
	for child in get_children():
		child.queue_free()
	for i in range(9):
		var cell = cell_scene.instantiate();
		cell.cell_id = i;
		add_child(cell);
