extends KinematicBody2D

export(String) var classPlayer

#Statistiques
export(int) var vitality
export(int) var strength
export(int) var defense
export(int) var intelligence
export(int) var luck
export(int) var dexterity
export(int) var speed

var hp
var moveSpeed
var jumpSpeed
var gravity
var velocity

func _ready():
	hp = vitality * 10
	moveSpeed = Globals.baseSpeed * speed
	jumpSpeed = Globals.jumpForce
	gravity = Globals.gravity
	velocity = Vector2.ZERO
	$Rotating/Sprite.play()

func _process(_delta):
	#Horizontal flip
	if velocity.x < 0:
		$Rotating.scale.x = -1
	elif velocity.x > 0:
		$Rotating.scale.x = 1
	
	#Animations
	if velocity.y != 0:
		if $Rotating/Sprite.get_animation() != "Jump":
			$Rotating/Sprite.set_animation("Jump")
	elif velocity.x != 0:
		if $Rotating/Sprite.get_animation() != "Run":
			$Rotating/Sprite.set_animation("Run")
	elif $Rotating/Sprite.get_animation() != "Idle":
		$Rotating/Sprite.set_animation("Idle")
		

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

func takeDamage(mini,maxi):
	hp -= Globals.rng.randi(mini,maxi+1)
