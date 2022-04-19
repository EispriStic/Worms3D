extends Camera2D

func _process(delta):
	# Just for testing. For the release, suppr this and put current on true by default
	if Input.is_action_just_pressed("cameraSwitch"):
		current = not current
