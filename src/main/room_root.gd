extends Node2D

@export var current_room: Node2D = null
@export var room_path: String = ""
@export var spawn_position: Vector2 = Vector2(0, 0)

func _ready() -> void:
	load_room(room_path, spawn_position)

func load_room(room_path: String, spawn_position: Vector2):
	if current_room != null:
		current_room.queue_free()
	
	var room_scene: PackedScene = load(room_path)
	current_room = room_scene.instantiate()
	
	add_child(current_room)
	current_room.global_position = spawn_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
