extends Spatial

var fireRate = 0.3
var timer = 999.9

onready var anim = $AnimationPlayer
onready var sound = $AudioStreamPlayer
onready var rayCast = $RayCast

func _physics_process(delta):
	timer += delta

func fire():
	if timer > fireRate:
		anim.play("Piou_Piou")
		sound.play()
		
		var obj = rayCast.get_collider()
		if obj != null and obj.has_method("receive_fire"):
			obj.receive_fire()
