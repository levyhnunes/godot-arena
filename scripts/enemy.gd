extends CharacterBody2D

signal died

@export var speed: float = 150.0

var player: Node2D


func _ready() -> void:
	# Procura o primeiro nó com a tag "player", esteja ele onde estiver na árvore.
	player = get_tree().get_first_node_in_group("player")


func _physics_process(_delta: float) -> void:
	if player == null:
		return
	velocity = global_position.direction_to(player.global_position) * speed
	move_and_slide()

func die() -> void:
	died.emit()
	queue_free()
