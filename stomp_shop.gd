extends Node3D
var inside = 0
@export_file("*.tscn") var scene
@onready var E = $MeshInstance3D4
@onready var anim = $AnimationPlayer2
signal new
# Called when the node enters the scene tree for the first time.
func _ready():
	E.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("e"):
		if inside == 1:
			Pole.shop_position = 1
				# Load the duplicated scene
			#emit_signal("new")
			#get_tree().reload_current_scene()
			get_tree().change_scene_to_file("res://shop_meny.tscn")


func _on_area_3d_body_entered(body):
	if body.name == "RigidBody3D":
		inside = 1
		E.visible = true
		anim.play("show")


func _on_area_3d_body_exited(body):
	if body.name == "RigidBody3D":
		inside = 0
		anim.play_backwards("show")
		await get_tree().create_timer(0.3).timeout
		E.visible = false
		
		
