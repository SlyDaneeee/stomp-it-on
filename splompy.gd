extends SoftBody3D

@export var jump = 1000
@export var rolling_force = 20
var jump_force: float = 7  # Jump strength
var is_on_ground: bool = false  # Track if the player is on the ground
var raycast_length: float = 1.2  # Ray length to check for ground
var minus = 0
var plus = 1
var result
var currentRotation = 90
# Called when the node enters the scene tree for the first time.
func _ready():
	set("attachments/0/point_index", 21)
	set("attachments/0/spatial_attachment_path", NodePath("../.."))
	set("attachments/0/offset", Vector3(-0.678, -0.47, 0.476))
	set("attachments/1/point_index", 62)
	set("attachments/1/spatial_attachment_path", NodePath("../.."))
	set("attachments/1/offset", Vector3(0.014, 1.065, -0.027))
	set("attachments/2/point_index", 20)
	set("attachments/2/spatial_attachment_path", NodePath("../.."))
	#set("attachments/0/offset", Vector3(0.014, 0.059, 0.059))
	set("attachments/3/point_index", 2)
	set("attachments/3/spatial_attachment_path", NodePath("../.."))
	#set("attachments/0/offset", Vector3(-0.678, -0.47, 0.476))
	set("attachments/4/point_index", 1)
	set("attachments/4/spatial_attachment_path", NodePath("../.."))
	#set("attachments/0/offset", Vector3(-0.678, -0.47, 0.476))
	set("attachments/5/point_index", 14)
	set("attachments/5/spatial_attachment_path", NodePath("../.."))
	#set("attachments/0/offset", Vector3(-0.678, -0.47, 0.476))
	set("attachments/6/point_index", 28)
	set("attachments/6/spatial_attachment_path", NodePath("../.."))
	#set("attachments/0/offset", Vector3(-0.678, -0.47, 0.476))
	set("attachments/7/point_index", 29)
	set("attachments/7/spatial_attachment_path", NodePath("../.."))
	#set("attachments/0/offset", Vector3(-0.678, -0.47, 0.476))
	set("attachments/8/point_index", 17)
	set("attachments/8/spatial_attachment_path", NodePath("../.."))
	#set("attachments/9/point_index", 48)
	#set("attachments/9/spatial_attachment_path", NodePath("../.."))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	pass
	
			#player.rotation_degrees.y = lerp_angle(rotation_degrees.y, 90, 2 * delta)
	
	
	#position.z = player.position.z
func _down(delta):
	pass


func _on_player_switch():
	#right = 3
	#left = 4
	minus = 1
	plus = 0


func _on_player_nop():
	plus = 1
	minus = 0
func check_if_on_ground():
	var space_state = get_world_3d().direct_space_state
	

	# If the raycast detects a collision, we are on the ground
	is_on_ground = result.size() > 0
