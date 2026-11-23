extends CharacterBody2D
const BULLET = preload("res://scenes/bullet.tscn")

# @export expõe a variável no Inspector: dá para ajustar com o jogo rodando.
@export var max_speed: float = 400.0
@export var acceleration: float = 2500.0
@export var friction: float = 3000.0


# Roda em passo fixo (60x/s por padrão), sincronizado com a física.
func _physics_process(delta: float) -> void:
	# Vetor normalizado a partir de 4 ações do Input Map (diagonal não fica mais rápida).
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	# Usa a propriedade 'velocity', move o corpo e desliza ao colidir.
	move_and_slide()
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		var bullet = BULLET.instantiate()
		bullet.global_transform = global_transform
		get_parent().add_child(bullet)


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		get_tree().reload_current_scene()
