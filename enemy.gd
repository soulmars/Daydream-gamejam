extends Node2D

@export var speed: float
@onready var target: CharacterBody2D = $"../CharacterBody2D"
@onready var progress_bar: ProgressBar = $ProgressBar
var health = 15

func _process(delta: float) -> void:
	progress_bar.value  = health
	if target:
		# Direction vector from follower to player
		var direction = target.global_position - global_position
		
		# Only move if not already very close
		if direction.length() > 120:
			# Move toward the player
			position += direction.normalized() * speed * delta


func hurt():
	if health - 1 >= 0:
		health -= 1
	if health == 0:
		queue_free()
	
