extends KinematicBody2D

#Statistiques
var vitality = 1
var strength = 1
var defense = 1
var intelligence = 1
var luck = 1
var dexterity = 1
var speed = 1
var HP = vitality * 10

var movingRight = true
var isOnGround = false
var velocity = Vector2.ZERO

func _physics_process(delta):
	move(delta)
	
func move(delta):
	velocity.x = 0
	
	if Input.is_action_pressed("right"):
		velocity.x += Globals.baseSpeed
	if Input.is_action_pressed("left"):
		velocity.x -= Globals.baseSpeed
	
	velocity.x *= speed * delta
	
	if velocity.x > 0:
		movingRight = true
	else:
		movingRight = false
	
	velocity.y += Globals.gravity * delta
	
	if Input.is_action_just_pressed("jump"):
		if isOnGround:
			velocity.y = - Globals.jumpForce
		
	move_and_slide(velocity, Vector2.UP)

func _on_FootArea_body_entered(_body):
	isOnGround = true

func _on_FootArea_body_exited(_body):
	isOnGround = false
