extends Node2D

const ENEMY = preload("res://scenes/enemy.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var enemy = ENEMY.instantiate()
	enemy.position = Vector2(randf_range(40, 1240), randf_range(40, 680))
	add_child(enemy)
