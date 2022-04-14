extends KinematicBody2D

#Statistiques
var vitality = 1
var strength = 1
var defense = 1
var intelligence = 1
var luck = 1
var dexterity = 1
var speed = 5
var HP = vitality * 10

var moveSpeed = Globals.baseSpeed * speed
var jumpSpeed = Globals.jumpForce
var gravity = Globals.gravity
var velocity = Vector2.ZERO
var isOnGround = false

func _physics_process(delta):
	move(delta)
	
func move(delta):
	# reset horizontal velocity
	velocity.x = 0
	
	# set horizontal velocity
	if Input.is_action_pressed("right"):
		velocity.x += moveSpeed
	if Input.is_action_pressed("left"):
		velocity.x -= moveSpeed
	
	velocity.x *= delta
	
	# apply gravity
	# player always has downward velocity
	velocity.y += gravity * delta
	
	# jump will happen on the next frame
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = -jumpSpeed # negative Y is up in Godot
	
	# actually move the player
	velocity = move_and_slide(velocity, Vector2.UP)
