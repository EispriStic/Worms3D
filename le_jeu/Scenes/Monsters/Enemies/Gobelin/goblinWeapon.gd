extends Area2D

func _on_goblinWeapon_body_entered(body):
	if body.get_name() == "Player":
		body.takeDamage(5,6)
