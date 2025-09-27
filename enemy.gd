extends Node2D

@export var speed: float
@onready var target: CharacterBody2D = $"../CharacterBody2D"


func _process(delta: float) -> void:
	if target:
		# Direction vector from follower to player
		var direction = target.global_position - global_position
		
		# Only move if not already very close
		if direction.length() > 120:
			# Move toward the player
			position += direction.normalized() * speed * delta
