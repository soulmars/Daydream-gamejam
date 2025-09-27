extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var collision_shape_2d: CollisionShape2D = $hitbox/CollisionShape2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	look_at(get_global_mouse_position())

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y  = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if Input.is_action_just_pressed("ui_accept"):
		attack()

	move_and_slide()


func attack():
	collision_shape_2d.disabled = false
	await get_tree().create_timer(0.5).timeout
	collision_shape_2d.disabled = true
	



func _on_hitbox_body_entered(body: Node2D) -> void:
	print("hello")
	body.hurt()
