extends KinematicBody2D

export(String) var classPlayer

#Statistiques
var vitality
var strength
var defense
var intelligence
var luck
var dexterity
var speed
var hp
var moveSpeed
var jumpSpeed
var gravity
var velocity

func _ready():
	if classPlayer == "Warrior":
		vitality = 6
		strength = 5
		defense = 5
		intelligence = 1
		luck = 2
		dexterity = 1
		speed = 3
	
	elif classPlayer == "Rogue":
		vitality = 3
		strength = 3
		defense = 2
		intelligence = 1
		luck = 4
		dexterity = 5
		speed = 5
	
	elif classPlayer == "Mage":
		vitality = 4
		strength = 1
		defense = 1
		intelligence = 5
		luck = 3
		dexterity = 2
		speed = 4
	
	hp = vitality * 10
	moveSpeed = Globals.baseSpeed * speed
	jumpSpeed = Globals.jumpForce
	gravity = Globals.gravity
	velocity = Vector2.ZERO

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
	
	# apply delta for smooth movement
	velocity.x *= delta
	
	# apply gravity
	velocity.y += gravity * delta
	
	# jump will happen on the next frame
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = -jumpSpeed # negative Y is up in Godot
	
	# actually move the player
	velocity = move_and_slide(velocity, Vector2.UP)

