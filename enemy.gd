extends Node2D

@export var speed: float = 100.0
@onready var target: CharacterBody2D = $"../CharacterBody2D"
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var character: CharacterBody2D = $"../CharacterBody2D"

var health: int = 15
var player: CharacterBody2D
var attacking: bool = false
var attack_cooldown: float = 0.25  # seconds between hits
var attack_timer: float = 0.0


func _process(delta: float) -> void:
	
	look_at(character.position)
	rotation_degrees -= 90
	progress_bar.value = health

	if target:
		# Direction vector to player
		var direction = target.global_position - global_position

		# Chase player if not too close
		if direction.length() > 120:
			position += direction.normalized() * speed * delta

	# Attack logic
	if attacking and player:
		attack_timer -= delta
		if attack_timer <= 0.0:
			player.hurt(1)
			attack_timer = attack_cooldown


func hurt(damage):
	if health - 1 >= 0:
		health -= 1
	if health == 0:
		queue_free()
		get_tree().change_scene_to_file("res://win.tscn")


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		attacking = true
		attack_timer = 0.0  # attack immediately when first touching


func _on_hurtbox_body_exited(body: Node2D) -> void:
	if body == player:
		attacking = false
		player = null
