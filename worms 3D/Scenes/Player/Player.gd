extends KinematicBody

var motion = Vector3.ZERO
onready var camera = $Camera
var mouseMotion = Vector2.ZERO
onready var gun = $Camera/Gun

const MAX_ANGLE = PI/2
const MIN_ANGLE = -PI/2

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	motion.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	motion.z = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	motion = motion.normalized()
	motion = motion.rotated(Vector3.UP, camera.rotation.y)
	move_and_slide(motion * 5, Vector3.UP)
	
	camera.rotation.x = min(max(camera.rotation.x - mouseMotion.y * delta, MIN_ANGLE), MAX_ANGLE)
	
	camera.rotation.y -= mouseMotion.x * delta
	mouseMotion = Vector2.ZERO

func _input(event):
	if Input.is_action_just_pressed("Piou"):
		gun.fire()
	if event is InputEventMouseMotion:
		mouseMotion = event.relative
