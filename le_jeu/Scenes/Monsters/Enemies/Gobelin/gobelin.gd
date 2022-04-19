extends KinematicBody2D

#Statistiques
var vitality = 1
var strength = 1
var defense = 1
var intelligence = 1
var luck = 1
var dexterity = 1
var speed = 2
var HP = vitality * 10

var mouvement = Vector2.ZERO
var direction = 1
var agro = false
var player
var diff
var gobelin


func _ready():
	pass

func _process(delta):
	gobelin = self.get_position()
	if agro:
		chasse(delta)
#		attaque()
		agro=false
	else:
		patrouille(delta)

func patrouille(delta):
	if is_on_wall():
		direction *= -1
	
	mouvement.x = Globals.baseSpeed * direction 
	mouvement.x *= speed * delta
	
	mouvement.y = Globals.gravity * delta
	
	move_and_slide(mouvement, Vector2.UP)

func chasse(delta):
	if is_on_wall() and is_on_floor():
		mouvement.y  = - Globals.jumpForce
	
	mouvement.x = Globals.baseSpeed 
	mouvement.x *= speed * delta
	
	mouvement.x *= direction
	
	mouvement.y = Globals.gravity * delta
	
	move_and_slide(mouvement, Vector2.UP)


#func _on_AgroArea_body_entered(body):
#	if body.get_name() == "Player":
#		agro = true
#	player = body.get_position()
#	diff = gobelin.x - player.x
#	if diff > 0:
#		direction = -1
#	elif diff < 0:
#		direction = 1
