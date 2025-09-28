extends Button


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
	Limbs.limbs =  ["rarm","larm","lleg","rleg"]
	Limbs.Player_health = 15
