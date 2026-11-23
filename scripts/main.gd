extends Node2D

const ENEMY = preload("res://scenes/enemy.tscn")

var score: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score += delta
	$HUD/ScoreLabel.text = "Tempo: %d" % score


func _on_timer_timeout() -> void:
	var enemy = ENEMY.instantiate()
	enemy.position = Vector2(randf_range(40, 1240), randf_range(40, 680))
	add_child(enemy)
