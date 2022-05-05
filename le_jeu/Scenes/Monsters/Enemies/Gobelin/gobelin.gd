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
var aggro = false
var player

func turn():
	pass

func _process(_delta):
	if mouvement.x > 0:
		scale.x = -1
	elif mouvement.x < 0:
		scale.x = 1

func _physics_process(_delta):
	if aggro:
		chasse()
#		attaque()
	else:
		patrouille()

func patrouille():
	if is_on_wall():	# changement de direction quand rencontre mur
		direction *= -1
	
	mouvement.x = Globals.baseSpeed * direction 
	mouvement.x *= speed # déplacement
	
	if !is_on_floor():
		mouvement.y += Globals.gravity	# aplication de la gravité
	print("---")
	print(scale.x)
	mouvement = move_and_slide(mouvement, Vector2.UP)
	print(scale.x)

func chasse():
	if is_on_wall() and is_on_floor():
		mouvement.y  = - Globals.jumpForce	# saute si obstacle lors de la poursuite
	
	if !is_on_floor():
		mouvement.y += Globals.gravity # aplication de la gravité
	
	direction = - sign(position.x - player.position.x)	# détecte la direction vers le joueur
	
	mouvement.x = Globals.baseSpeed * direction
	mouvement.x *= speed # déplacement
	
	var temp = move_and_slide(mouvement, Vector2.UP)


func _on_AggroArea_body_entered(body):
	if body.get_name() == "Player":
		aggro = true
		player = body	# détecte la présence du joueur dans la zone d'aggro

func _on_AggroArea_body_exited(body):
	if body.get_name() == "Player":
		aggro = false
		player = null	# détecte la sortie de de la zone d'aggro
