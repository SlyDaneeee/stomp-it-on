extends Node3D
@onready var pling = $"../../coin_sound"
@onready var parti = $GPUParticles3D
@onready var silf = $Cylinder
var one = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	parti.emitting = false
	silf.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation.y += 2 * delta


func _on_area_3d_body_entered(body):
	if body.name == "RigidBody3D":
		if one == 0:
			silf.visible = false
			one = 1
			pling.play()
			Pole.money += 1
			parti.emitting = true
			await get_tree().create_timer(1).timeout
			parti.emitting = false
			await get_tree().create_timer(4).timeout
			queue_free()
