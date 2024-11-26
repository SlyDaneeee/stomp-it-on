extends RigidBody3D
@onready var splompy = $"../splompy"
@onready var player = $"../Player"
@onready var respawn = $"../../respawn"
@export var jump = 1000
@export var rolling_force = 18
@onready var wait = $"../../corner/AnimationPlayer2"
signal back
var ground_check_tolerance: float = 0.2
var jump_force: float = 7  # Jump strength
var is_on_ground: bool = false  # Track if the player is on the ground
var raycast_length: float = 1.2  # Ray length to check for ground
var minus = 0
var plus = 1
var result
var currentRotation = 90
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rotation.y += 1 * delta
	if Input.is_action_just_pressed("jump") and abs(linear_velocity.y) < ground_check_tolerance:
			jjump()
	if Pole.poler == 1:
		pass
	if angular_velocity.x > 35:
		angular_velocity.x = 0 
		angular_velocity.y = 0
	if angular_velocity.y > 35:
		angular_velocity.y = 0 

	if Input.is_action_pressed("up"):
		if Pole.poler == 1:
			angular_velocity.x -= rolling_force * delta
		if Pole.poler == 0:
			angular_velocity.x += rolling_force * delta
		if Pole.poler == 3:
			angular_velocity.z += rolling_force * delta
		if Pole.poler == 4:
			angular_velocity.z -= rolling_force * delta
	if Input.is_action_pressed("down"):
		if Pole.poler == 1:
			angular_velocity.x += rolling_force * delta
		if Pole.poler == 0:
			angular_velocity.x -= rolling_force * delta
		if Pole.poler == 3:
			angular_velocity.z -= rolling_force * delta
		if Pole.poler == 4:
			angular_velocity.z += rolling_force * delta
	if Input.is_action_pressed("left"):
		if Pole.poler == 1:
			angular_velocity.z += rolling_force * delta
		if Pole.poler == 0:
			angular_velocity.z -= rolling_force * delta
		if Pole.poler == 3:
			angular_velocity.x += rolling_force * delta
		if Pole.poler == 4:
			angular_velocity.x -= rolling_force * delta
		
	if Input.is_action_pressed("right"):
		if Pole.poler == 1:
			angular_velocity.z -= rolling_force * delta
		if Pole.poler == 0:
			angular_velocity.z += rolling_force * delta
		if Pole.poler == 3:
			angular_velocity.x -= rolling_force * delta
		if Pole.poler == 4:
			angular_velocity.x += rolling_force * delta
	if Input.is_action_just_pressed("checkpoint"):
		if Pole.not_ready == 0:
			Pole.not_ready = 1
			self.visible = false
			global_position = respawn.global_position
			emit_signal("back")
			Pole.stay = 1
			await get_tree().create_timer(1).timeout
			Pole.stay = 0
			angular_velocity.x = 0
			angular_velocity.y = 0
			angular_velocity.z = 0
			linear_velocity.y = 10
			linear_velocity.z = 1
			linear_velocity.x = 0
			self.visible = true
			if Pole.check == 2:
				linear_velocity.z += -1
			if Pole.check == 1:
				linear_velocity.z += 1
		
		
			#player.rotation_degrees.y = lerp_angle(rotation_degrees.y, 90, 2 * delta)
	
	
	#position.z = player.position.z
func _down(delta):
	player.rotation_degrees.y = lerp_angle(rotation_degrees.y, -180, 2 * delta)


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
func jjump():
	apply_impulse(Vector3(0, jump_force, 0))  # Apply upward impulse
	linear_velocity.y = 8  # Reset any downward velocity
	  # Apply upward impulse





func _on_jumper_jump():
	linear_velocity.y = 15 
	if Pole.poler == 1:
		linear_velocity.z = -2
	if Pole.poler == 0:
		linear_velocity.z = 2
	if Pole.poler == 3:
		linear_velocity.x = -2
	if Pole.poler == 4:
		linear_velocity.x = 2
