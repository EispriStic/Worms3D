extends Node2D

var vitality = 1
var strength = 1
var defense = 1
var intelligence = 1
var luck = 1
var dexterity = 1
var HP = vitality * 10

func _process(delta):
	move(delta)
	
func move(delta):
	position.x += (Input.get_action_strength("right") - Input.get_action_strength("left")) * delta * 50
	position.y += ((Input.get_action_strength("crounch") - Input.get_action_strength("jump") * 50) + Globals.gravity) * delta
