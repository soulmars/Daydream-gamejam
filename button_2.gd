extends Button



func _on_pressed() -> void:
	for i in range(0,Limbs.limbs.size()-1):
		if Limbs.limbs[i] == "lleg":
			Limbs.limbs.remove_at(i)
