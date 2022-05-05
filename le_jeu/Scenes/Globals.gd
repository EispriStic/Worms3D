extends Node

var gravity = 20
var baseSpeed = 30
var jumpForce = 350

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
