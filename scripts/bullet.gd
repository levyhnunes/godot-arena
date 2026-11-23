extends Area2D

@export var speed: float = 900.0


func _ready() -> void:
	# Sinal: "quando um corpo encostar em mim, chama essa função".
	body_entered.connect(_on_body_entered)


func _physics_process(delta: float) -> void:
	# transform.x = a direção para onde a bala está virada.
	position += transform.x * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.queue_free() # mata o inimigo
		queue_free() # a bala some
	if body is StaticBody2D:  # bateu na parede
		queue_free()  # remove a bala do jogo
