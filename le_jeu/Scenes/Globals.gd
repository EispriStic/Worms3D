extends Node

var gravity = 2500
var baseSpeed = 2000
var jumpForce = 500

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
