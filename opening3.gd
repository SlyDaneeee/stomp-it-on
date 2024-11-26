extends Node3D
@onready var stati = $Cylinder/StaticBody3D
@onready var open = $door/AnimationPlayer
@onready var fla = $door/flag/AnimationPlayer2
@onready var splomp = $"../splompers"
@onready var wait = $"../corner/AnimationPlayer"
var one = 0
var normal = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	fla.stop(true)
	Pole.check = 1
	normal = stati.position.z


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Pole.stay == 1:
		splomp.global_position = splomp.global_position
		_stay()
	if Pole.not_ready == 1:
		wait.play("cooldown")
		
		
		

func _stay():
	stati.position.z = 100000
	await get_tree().create_timer(1.5).timeout
	stati.position.z = normal
	
func _on_rigid_body_3d_back():
	
	open.play("open")
	


func _on_area_3d_body_entered(body):
	if one == 0:
		if body.name == "RigidBody3D":
			fla.play("topping")
			Pole.check = 3
			one = 1
