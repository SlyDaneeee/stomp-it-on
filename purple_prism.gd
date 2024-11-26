extends Node3D
var fall = 0
signal no_particles
var one = 0
var normal = 0
@onready var stati = $StaticBody3D
@onready var particles = $"../GPUParticles3D"
# Called when the node enters the scene tree for the first time.
func _ready():
	particles.emitting = false
	normal = stati.position.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fall == 1:
		_que()
	if fall == 0:
		one = 0 
		visible = true
		stati.position.x = normal


func _on_area_3d_body_entered(body):
	if body.name == "RigidBody3D":
		fall = 1
func  _que():
	if one == 0:
		await get_tree().create_timer(2.5).timeout
		visible = false
		one = 1
		stati.position.x = 1000000
		particles.emitting = true
		await get_tree().create_timer(0.5).timeout
		particles.emitting = false
		await get_tree().create_timer(7).timeout
		fall = 0
