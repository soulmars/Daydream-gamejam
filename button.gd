extends Button




func _on_pressed() -> void:
	for i in range(Limbs.limbs.size()-1):
		if Limbs.limbs[i] == "larm":
			Limbs.limbs.remove_at(i)
